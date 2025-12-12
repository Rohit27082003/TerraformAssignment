# SSH-Key Module - Dynamically create SSH key pair

# Generate SSH key pair
resource "tls_private_key" "main" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Save private key to local file
resource "local_file" "private_key" {
  content         = tls_private_key.main.private_key_pem
  filename        = "${path.module}/${var.key_name}.pem"
  file_permission = "0400"
}

# Save public key to local file
resource "local_file" "public_key" {
  content  = tls_private_key.main.public_key_openssh
  filename = "${path.module}/${var.key_name}.pub"
}

# Upload public key to AWS
resource "aws_key_pair" "main" {
  key_name   = var.key_name
  public_key = tls_private_key.main.public_key_openssh

  tags = {
    Name = "${var.project_name}-ssh-key"
  }
}

