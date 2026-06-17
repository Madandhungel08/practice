# Output Variables - Values returned after Terraform apply
output "bucket_name" {
  description = "Name of the S3 bucket"
  value       = aws_s3_bucket.demo.bucket
}

output "bucket_arn" {
  description = "ARN of the S3 bucket"
  value       = aws_s3_bucket.demo.arn
}

output "environment" {
  description = "Environment from input variable"
  value       = var.environment
}
output "bucket_name_from_variable" {
  description = "Bucket name from input variable"
  value       = var.bucket_name
}