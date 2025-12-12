# Outputs

output "vpc_id" {
  description = "ID of the VPC"
  value       = module.networking.vpc_id
}

output "public_subnet_1_id" {
  description = "ID of public subnet 1"
  value       = module.networking.public_subnet_1_id
}

output "private_subnet_1_id" {
  description = "ID of private subnet 1"
  value       = module.networking.private_subnet_1_id
}

output "public_ec2_instance_id" {
  description = "ID of the public EC2 instance"
  value       = module.ec2.public_ec2_instance_id
}

output "public_ec2_public_ip" {
  description = "Public IP of the public EC2 instance (NGINX server)"
  value       = module.ec2.public_ec2_public_ip
}

output "public_ec2_public_dns" {
  description = "Public DNS of the public EC2 instance (NGINX server)"
  value       = module.ec2.public_ec2_public_dns
}

output "private_ec2_instance_id" {
  description = "ID of the private EC2 instance"
  value       = module.ec2.private_ec2_instance_id
}

output "private_ec2_private_ip" {
  description = "Private IP of the private EC2 instance"
  value       = module.ec2.private_ec2_private_ip
}

output "ssh_key_name" {
  description = "Name of the SSH key pair"
  value       = aws_key_pair.main.key_name
}

output "ssh_private_key_path" {
  description = "Path to the private key file"
  value       = local_file.private_key.filename
}

output "nginx_url" {
  description = "URL to access NGINX"
  value       = "http://${module.ec2.public_ec2_public_ip}"
}

