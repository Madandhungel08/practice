terraform{
    backend "remote_s3" {
        bucket = "${var.bucket_name}-${var.env}"
        key    = "terraform.tfstate"
        region = "us-east-2"
    }
}