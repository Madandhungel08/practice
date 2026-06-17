terraform {
  backend "s3" {
    bucket                      = "madans3"
    region                      = "us-east-1"
    key                         = "madan/terraform.tfstate"
    endpoints = {
      s3 = "http://localstack.local.com"
    }
    use_path_style              = true
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_requesting_account_id  = true
  }
}
