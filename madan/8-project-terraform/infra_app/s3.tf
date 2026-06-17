resource "aws_s3_bucket" "s3_bucket" {
  bucket = "${var.bucket_name}-${var.env}"

tags = {
    Name        = "${var.bucket_name}-${var.env}"
    Environment = var.env
  }
} 
