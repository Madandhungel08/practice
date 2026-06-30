variable "sg_name" {
  type        = string
  description = "Name of the security group"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID where SG will be created"
}

variable "ingress_ports" {
  type        = list(number)
  description = "List of allowed inbound ports"
}