data "aws_availability_zones" "available" {
  state = "available"
}

module "networking" {
  source = "./modules/networking"

  project_name = var.project_name
  vpc_cidr     = var.vpc_cidr
  azs          = slice(data.aws_availability_zones.available.names, 0, 2)
}

module "database" {
  source = "./modules/database"

  project_name       = var.project_name
  subnet_ids         = module.networking.database_subnet_ids
  security_group_id  = module.networking.db_security_group_id
  db_username        = var.db_username
  db_password        = var.db_password
}

module "loadbalancer" {
  source = "./modules/loadbalancer"

  project_name      = var.project_name
  vpc_id            = module.networking.vpc_id
  public_subnet_ids = module.networking.public_subnet_ids
  security_group_id = module.networking.alb_security_group_id
}

module "dns" {
  source = "./modules/dns"

  domain_name  = var.domain_name
  alb_dns_name = module.loadbalancer.alb_dns_name
  alb_zone_id  = module.loadbalancer.alb_zone_id
}

module "compute" {
  source = "./modules/compute"

  project_name       = var.project_name
  private_subnet_ids = module.networking.private_subnet_ids
  security_group_id  = module.networking.app_security_group_id
  target_group_arn   = module.loadbalancer.target_group_arn
  db_endpoint        = module.database.db_endpoint
}