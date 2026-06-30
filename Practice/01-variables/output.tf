output "random_output" {
  value = "Hello you! This is a random output from Terraform."
}

output "instance_public_id" {
  value = aws_instance.tf_instance.public_ip
}