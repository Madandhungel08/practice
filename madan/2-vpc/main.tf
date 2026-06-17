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

resource "aws_vpc" "subnet-main" {
  cidr_block = "172.16.0.0/16"
  tags = {
    Name = "parent-subnet"
  }
}

resource "aws_subnet" "subnet-1" {
  vpc_id     = aws_vpc.subnet-main.id
  cidr_block = "172.16.1.0/24"
  tags = {
    Name = "subnet-1"
  }
}