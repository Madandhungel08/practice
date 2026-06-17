 

resource "aws_key_pair" "ssh-key" {
  key_name   = "ssh-key-${var.env}"
  public_key = file("~/.ssh/id_rsa.pub")  
}

    