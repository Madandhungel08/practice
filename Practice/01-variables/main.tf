provider "aws" {
  region = "us-east-1"
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


resource "aws_instance" "tf_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "Terraform_Instance"
  }
}

resource "aws_s3_bucket" "terraform_bucket" {
  bucket = "terraform-bucket"
}
