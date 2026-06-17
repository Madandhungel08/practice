provider "aws" {
  region     = "us-east-1"
  access_key = "test"
  secret_key = "test"

  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    ec2 = "http://localstack.local.com"
    s3  = "http://localstack.local.com"
  }
  s3_use_path_style = true
}

variable "ami" {
  description = "The AMI to use for the instance"
  type        = string
}

variable "instance_type" {
  description = "The type of instance to use"
  type        = string
}

resource "aws_instance" "ubuntu" {
  ami           = var.ami
  instance_type = var.instance_type
}

