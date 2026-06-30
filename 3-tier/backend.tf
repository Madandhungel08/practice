terraform {
  backend "s3" {
    bucket       = "3_tier_app_tf_state"
    key          = "terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = true
  }
}