output "security_group_id" {
  value = aws_security_group.sg.id
}

output "allowed_ports" {
  value       = sort(var.ingress_ports)
  description = "List of allowed inbound ports for this security group"
}