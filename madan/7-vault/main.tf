provider "aws" {
  region                      = "us-east-1"
}

provider "vault" {
  address = "http://192.168.1.30:8200"
  skip_child_token = true

  auth_login {
    path = "approle"
    parameters = {
        role_id   = "demo-role-id"
        secret_id = "demo-secret-id"
        }
    }
}

data "vault_kv_secret_v2" "aws_creds" {
    mount = "aws"
  name = "creds/demo-role"
}

resource "aws_instance" "demo" {
  ami           = "ami-1234567890abcdef"
  instance_type = "t2.micro"
  
  root_block_device {
    volume_size = 15
    volume_type = "gp3"
  }

  tags = {
    Name = "localstack-vault"
  }
}

 