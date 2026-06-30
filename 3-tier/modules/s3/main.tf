
resource "aws_s3_bucket" "my_bucket" {
  bucket = var.bucket_name
}


resource "aws_s3_bucket_versioning" "terraform_tf_state_versioning" {
  bucket = aws_s3_bucket.terraform_tf_state.id

  versioning_configuration {
    status = "Enabled"
  }
}

