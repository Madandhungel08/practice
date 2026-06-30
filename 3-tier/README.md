Deploying a 3 tier application

```


#1. create vpc
#2. create internet gateway
#3. create route table
#4. create a subnet
#5. associate route table with subnet
#6. create a security group and allow port 80,443,22
#7. create a network intrface and attach to subnet(step 4)
#8. Assign an elastic IP to the network interface(step 7)
#9. create an ubuntu server and install/enable apache2

#1. create vpc
resource "aws_vpc" "production" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "production"
  }
}

#2. create internet gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.production.id
}

#3. create route table
resource "aws_route_table" "prod_routetable" {
  vpc_id = aws_vpc.production.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
}

#4. create a subnet
resource "aws_subnet" "prod_subnet" {
  vpc_id     = aws_vpc.production.id
  cidr_block = "10.0.1.0/24"
}

#5. associate route table with subnet
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.prod_subnet.id
  route_table_id = aws_route_table.prod_routetable.id
}

#6. create a security group and allow port 80,443,22
resource "aws_security_group" "allow_web" {
  name        = "allow_web"
  description = "Allow web traffic"
  vpc_id      = aws_vpc.production.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

#7. create a network intrface and attach to subnet(step 4)
resource "aws_network_interface" "web_nic" {
  subnet_id       = aws_subnet.prod_subnet.id
  private_ips     = ["10.1.0.20"]
  security_groups = [aws_security_group.allow_web.id]
}

#8. Assign an elastic IP to the network interface(step 7)
resource "aws_eip" "web_eip" {
  domain                    = "vpc"
  network_interface         = aws_network_interface.web_nic.id
  associate_with_private_ip = "10.1.0.20"
  depends_on                = [aws_internet_gateway.gw]
}

#9. create an ubuntu server and install/enable apache2
resource "aws_instance" "web_server" {
  ami               = "ami-0c94855ba95c71c99mad"
  instance_type     = "t2.micro"
  availability_zone = "us-east-1a"
  key_name          = "madan-key"

  network_interface {
    network_interface_id = aws_network_interface.web_nic.id
    device_index       = 0
  }
  
  user_data = <<-EOF
                #!/bin/bash
                apt-get update -y
                apt-get install -y apache2
                systemctl start apache2
                systemctl enable apache2

                EOF

  tags = {
    Name = "web-server"
  }
}

```