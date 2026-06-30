resource "aws_vpc" "tier-vpc" {
  cidr_block = var.vpc_cidr
#   enable_dns_support   = true
#   enable_dns_hostnames = true

  tags = {
    Name = "${var.project_name}-vpc"
  }
}

resource "aws_internet_gateway" "tier-gateway" {
  vpc_id = aws_vpc.tier-vpc.id

  tags = {
    Name = "${var.project_name}-igw"
  }
}

resource "aws_subnet" "public_subnets" {
  vpc_id = aws_vpc.tier-vpc.id
  cidr_block = var.public_subnets[0]
  availability_zone = var.public_subnets_az[0]
}

resource "aws_subnet" "private_subnets" {
  vpc_id = aws_vpc.tier-vpc.id
  cidr_block = var.private_subnets[0]
  availability_zone = var.private_subnets_az[0]
}


resource "aws_route_table" "tier-route-table" {
  vpc_id = aws_vpc.tier-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.tier-gateway.id
  }
}

resource "aws_route_table_association" "public_subnet_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.tier-route-table.id
}

resource "aws_route_table_association" "private_subnet_association" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.tier-route-table.id
}


