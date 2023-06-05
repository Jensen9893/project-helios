# create a vpc

module "vpc" {
  source      = "./modules/networking/vpc"
  my_project  = var.my_project
  vpc_cidr    = var.vpc_cidr

}

# create internet gateway

module "igw" {
  source        = "./modules/networking/igw"
  vpc_id        = module.vpc.vpc_id
  project_name  = module.vpc.project_name
}

# create subnets

module "subnets" {
  source = "./modules/networking/subnets"
  vpc_id = module.vpc.vpc_id
  public_subnets = var.public_subnets
  private_app_subnets = var.private_app_subnets
  private_data_subnets = var.private_data_subnets
  zone_id = var.zone_id
}

# # create a route table

# module "route_tables" {
#   source = "./modules/networking/route-tables"
#   vpc_id = module.vpc.vpc_id
#   igw_id = module.igw.igw_id
#   heliostech_public_subnet_id = module.subnets.heliostech_public_subnet_id
# }

# create NAT-gateway

# module "nat-gateway" {
#   source = "./modules/nat-gateway"
# }