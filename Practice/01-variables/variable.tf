variable "instance_type" {
  description = "The type of instance to use for the web server"
  type        = string
  default     = "t2.micro"

}

variable "ami_id" {
  description = "The AMI ID to use for the instance"
  type        = string
  default     = "ami-0c55b159cbfafe1f0" # Amazon Linux 2 AMI (HVM), SSD Volume Type
}