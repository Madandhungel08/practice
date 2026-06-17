resource "aws_s3_bucket" "terraform_state_bucket" {
  bucket = "madan-terraform-state"

  tags = {
    Name        = "My Terraform State Bucket"
    Environment = "Dev"
  }
}