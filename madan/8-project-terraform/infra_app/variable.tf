variable "env" {
  description = "environment isolation"
  type        = string
  default     = "dev"
}

variable "bucket_name" {
  description = "name of the s3 bucket"
  type        = string
  default     = "my-terraform-bucket"
}

variable "instance_count" {
  description = "number of EC2 instances to create"
  type        = number
  default     = 1
}

variable "instance_type" {
  description = "type of EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "ec2_ami_id" {
  description = "AMI ID for EC2 instance"
  type        = string
  default     = "ami-0c55b159cbfafe1f0" # Amazon Linux 2 AMI (HVM), SSD Volume Type
}

variable "hash_key" {
  description = "name of the hash key for DynamoDB table"
  type        = string
  default     = "id"
}

