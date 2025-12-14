module "ec2" {
  source = "./modules/ec2"

  project_name      = var.project_name
  vpc_id            = module.networking.vpc_id
  public_subnet_id  = module.networking.public_subnet_1_id
  private_subnet_id = module.networking.private_subnet_1_id
  instance_type     = var.instance_type
  key_name          = aws_key_pair.main.key_name

  depends_on = [
    module.networking,
    aws_key_pair.main
  ]
}

