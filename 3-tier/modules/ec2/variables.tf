variable "ami" {
  description = "The AMI ID for the application server"
  type        = string
}

variable "instance_type" {
  description = "The instance type for the application server"
  type        = string
}

variable "subnet_id" {
  description = "The subnet ID for the application server"
  type        = string
}

variable "security_groups" {
  description = "The security groups for the application server"
  type        = list(string)
}
