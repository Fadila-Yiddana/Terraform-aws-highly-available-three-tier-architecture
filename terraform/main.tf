module "networking" {
  source = "./modules/networking"

  project_name = var.project_name
  vpc_cidr     = var.vpc_cidr
  common_tags  = local.common_tags
}

module "compute" {
  source = "./modules/compute"

  project_name           = var.project_name
  vpc_id                 = module.networking.vpc_id
  public_subnet_ids      = [module.networking.public_subnet_a_id, module.networking.public_subnet_b_id]
  private_app_subnet_ids = [module.networking.private_app_subnet_a_id, module.networking.private_app_subnet_b_id]
  instance_type          = var.instance_type
  common_tags            = local.common_tags
}

module "database" {
  source = "./modules/database"

  vpc_id                = module.networking.vpc_id
  private_db_subnet_ids = [module.networking.private_db_subnet_a_id, module.networking.private_db_subnet_b_id]
  ec2_sg_id             = module.compute.ec2_sg_id
  db_name               = var.db_name
  db_username           = var.db_username
  db_password           = var.db_password
  common_tags           = local.common_tags
}