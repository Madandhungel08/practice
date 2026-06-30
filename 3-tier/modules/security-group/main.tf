resource "aws_security_group" "sg" {
  name        = var.sg_name
  description = "Security group for ${var.sg_name}"
  vpc_id      = var.vpc_id

  tags = {
    Name = var.sg_name
  }
}

# Ingress rules (dynamic)
resource "aws_vpc_security_group_ingress_rule" "ingress" {
  for_each = toset(var.ingress_ports)

  security_group_id = aws_security_group.sg.id

  ip_protocol = "tcp"
  from_port   = each.value
  to_port     = each.value

  cidr_ipv4 = "0.0.0.0/0"
}

# Allow all outbound traffic
resource "aws_vpc_security_group_egress_rule" "egress" {
  security_group_id = aws_security_group.sg.id

  ip_protocol = "-1"
  cidr_ipv4   = "0.0.0.0/0"
}