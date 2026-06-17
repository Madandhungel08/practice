resource "aws_s3_bucket" "madan_bucket" {
  bucket = "madan-bucket-terraform"

  tags = {
    Name        = "Madan S3 Bucket"
    Environment = "Dev"
  }
}