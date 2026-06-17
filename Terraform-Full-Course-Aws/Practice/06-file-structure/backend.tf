terraform {
  backend "aws" {
    bucket = "madan-terraform-state"
    key    = "projectA/terraform.tfstate"
    region = "us-east-1"
    use_lockfile = true
  }
}