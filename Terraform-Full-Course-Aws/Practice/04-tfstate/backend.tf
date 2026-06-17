terraform {
  backend "s3" {
    bucket = "my-terraform-state-bucket"
    key    = "evomart/terraform.tfstate"
    region = "us-east-1"
    use_lockfile = true
  }
}
