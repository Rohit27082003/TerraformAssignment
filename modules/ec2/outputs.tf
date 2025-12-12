# EC2 Module Outputs

output "public_ec2_instance_id" {
  description = "ID of the public EC2 instance"
  value       = aws_instance.public.id
}

output "public_ec2_public_ip" {
  description = "Public IP of the public EC2 instance (NGINX server)"
  value       = aws_instance.public.public_ip
}

output "public_ec2_public_dns" {
  description = "Public DNS of the public EC2 instance (NGINX server)"
  value       = aws_instance.public.public_dns
}

output "public_ec2_private_ip" {
  description = "Private IP of the public EC2 instance"
  value       = aws_instance.public.private_ip
}

output "private_ec2_instance_id" {
  description = "ID of the private EC2 instance"
  value       = aws_instance.private.id
}

output "private_ec2_private_ip" {
  description = "Private IP of the private EC2 instance"
  value       = aws_instance.private.private_ip
}

output "public_security_group_id" {
  description = "ID of the public EC2 security group"
  value       = aws_security_group.public_ec2.id
}

output "private_security_group_id" {
  description = "ID of the private EC2 security group"
  value       = aws_security_group.private_ec2.id
}

