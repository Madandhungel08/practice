module "dev-infra" {
  source = "./infra_app"
  env = "dev"
  bucket_name = "infra-app-bucket"
  instance_count = 1
  instance_type = "t2.micro"
  ec2_ami_id = "ami-0987654321"
  hash_key = "id"
}