# create public subnet

resource "aws_subnet" "heliostech_public_subnet" {
  count                   = length(var.public_subnets)
  vpc_id                  = var.vpc_id
  cidr_block              = var.public_subnets[count.index]
  availability_zone       = var.zone_id[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name = "heliostech public subnet ${count.index}"
  }
}

# create private app subnets

resource "aws_subnet" "heliostech_private_app_subnet" {
  count                   = length(var.private_app_subnets)
  vpc_id                  = var.vpc_id
  cidr_block              = var.private_app_subnets[count.index]
  availability_zone       = var.zone_id[count.index]
  map_public_ip_on_launch = false

  tags = {
    Name = "heliostech private app subnet ${count.index}"
  }
}

# Create private data subnets

resource "aws_subnet" "heliostech_private_data_subnet" {
  count                   = length(var.private_data_subnets)
  vpc_id                  = var.vpc_id
  cidr_block              = var.private_data_subnets[count.index]
  availability_zone       = var.zone_id[count.index]
  map_public_ip_on_launch = false

  tags = {
    Name = "heliostech private data subnet ${count.index}"
  }
}