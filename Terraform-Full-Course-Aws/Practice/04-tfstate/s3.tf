resource "aws_s3_bucket" "terraform_state_bucket" {
  bucket = "my-terraform-state-bucket"

  tags = {
    Name        = "My Terraform State Bucket"
    Environment = "Dev"
  }
}