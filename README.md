# Terraform AWS VPC and EC2 Deployment

This Terraform configuration creates a custom VPC with two EC2 instances - one in a public subnet running NGINX (accessible from the internet) and one in a private subnet.

## Structure

The code is organized into modules and main configuration files:

### Modules

1. **Networking Module** (`modules/networking/`): Defines the VPC and all its components
   - VPC
   - Internet Gateway
   - Public and Private Subnets (2 each)
   - NAT Gateway
   - Route Tables and Associations

2. **EC2 Module** (`modules/ec2/`): Deploys EC2 instances
   - Public EC2 instance with NGINX installed
   - Private EC2 instance
   - Security groups for both instances

### Main Configuration

3. **Networking** (`networking.tf`): Calls the networking module

4. **SSH-Key** (`ssh-key.tf`): Dynamically creates an SSH key pair
   - Generates RSA key pair using TLS provider
   - Saves keys locally
   - Uploads public key to AWS

5. **EC2** (`ec2.tf`): Calls the EC2 module

6. **Main** (`main.tf`): Provider configuration

7. **Variables** (`variables.tf`): Input variables

8. **Outputs** (`outputs.tf`): Output values

## Prerequisites

- Terraform >= 1.0
- AWS CLI configured with appropriate credentials
- AWS account with necessary permissions

## Usage

1. Initialize Terraform:
   ```bash
   terraform init
   ```

2. Review the execution plan:
   ```bash
   terraform plan
   ```

3. Apply the configuration:
   ```bash
   terraform apply
   ```

4. Access NGINX:
   - After deployment, check the outputs for the public IP
   - Access NGINX at: `http://<public-ip>`

5. SSH to instances:
   ```bash
   # Public instance
   ssh -i terraform-key.pem ec2-user@<public-ip>
   
   # Private instance (via public instance)
   ssh -i terraform-key.pem ec2-user@<private-ip>
   ```

## Outputs

After deployment, Terraform will output:
- VPC ID
- Subnet IDs
- EC2 instance IDs and IPs
- SSH key information
- NGINX URL

## Cleanup

To destroy all resources:
```bash
terraform destroy
```

## Notes

- The public EC2 instance has NGINX installed via user data script
- NGINX is accessible from the internet on ports 80 and 443
- The private EC2 instance can only be accessed via the public instance
- SSH keys are saved locally as `terraform-key.pem` and `terraform-key.pub`

