terraform {
  required_version = ">= 0.13.0"

  backend "s3" {
    bucket         = "terraform-state-assignment09"
    key            = "terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "TerraformState"
    encrypt        = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "~> 3.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

