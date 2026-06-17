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

resource "aws_instance" "web" {
  ami           = "ami-0c94855ba95c71c99"
  instance_type = "t2.micro"

  tags = {
    Name = "WebServer"
  }
}

resource "aws_s3_bucket" "madan_bucket" {
  bucket = "madan-bucket-12345"
}