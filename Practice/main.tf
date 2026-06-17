terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region                      = "us-east-1"
  access_key                  = "test"
  secret_key                  = "test"

  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    ec2 = "http://192.168.1.30:31566"
    s3  = "http://192.168.1.30:31566"
  }
}

resource "aws_instance" "demo" {
  ami           = "ami-1234567mad"
  instance_type = "t2.micro"
  
  # root_block_device {
  #   volume_size = 15
  #   volume_type = "gp3"
  # }

  tags = {
    Name = "localstack-demo"
  }
}