# create a vpc

module "vpc"{
  source       = "./modules/vpc"
  region       = var.region
  project_name = var.project_name
  vpc_cidr     = var.vpc_cidr
}

# create internet gateway

module "igw" {
  source        = "./modules/igw"
  vpc_id        = module.vpc.vpc_id
  project_name  = module.vpc.project_name
}

# create subnets

module "subnets" {
  source                        = "./modules/subnets"
  vpc_id                        = module.vpc.vpc_id
  count_subnet                  = var.count_subnet
}

# create a route table

module "route_tables" {
  source = "./modules/route-tables"
  vpc_id = module.vpc.vpc_id
  igw_id = module.igw.igw_id
  heliostech_public_subnet_id = module.subnets.heliostech_public_subnet_id
}

# create NAT-gateway

# module "nat-gateway" {
#   source = "./modules/nat-gateway"
# }