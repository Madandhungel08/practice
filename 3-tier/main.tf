module "vpc" {
  source = "./modules/vpc"

  project_name    = "3_tier_app"
  vpc_cidr        = "10.0.0.0/16"
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  private_subnets = ["10.0.100.0/24", "10.0.200.0/24", "10.0.300.0/24"]

}

module "security-group" {
  source = "./modules/security-group"

  sg_name       = "sg-application"
  vpc_id        = modules.vpc.vpc_id
  ingress_ports = [22, 80, 443]
}

module "ec2" {
  source = "./modules/ec2"

  ami             = "ami-0c55b159cbfafe1f0"
  instance_type   = "t2.micro"
  subnet_id       = "subnet-0bb1c79de3EXAMPLE"
  security_groups = [module.security-group.aws_security_group.sg.id]
}


module "s3" {
  source = "./modules/s3"
  bucket_name = "${var.project_name}-bucket"
}

module "terraform_state_file" {
  source = "./modules/s3"
  bucket_name = ""
}