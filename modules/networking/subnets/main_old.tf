# use data source to get all avalablility zones in region
data "aws_availability_zones" "available" {
    filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}

resource "aws_subnet" "heliostech_public_subnet" {
  count                   = length(var.subnets)
  vpc_id                  = var.vpc_id  # aws_vpc.module.id
  cidr_block              = var.subnets[count.index].cidr
  availability_zone       = var.subnets[count.index].az
  map_public_ip_on_launch = true

  tags = {
    Name = "heliostech public subnet ${count.index}"
  }
}

resource "aws_subnet" "heliostech_private_app_subnet" {
  count                   = length(var.subnets)
  vpc_id                  = var.vpc_id  # aws_vpc.module.id
  cidr_block              = var.subnets[count.index].cidr
  availability_zone       = var.subnets[count.index].az
  map_public_ip_on_launch = false

  tags = {
    Name = "heliostech pivate app subnet ${count.index}"
  }
}

resource "aws_subnet" "heliostech_private_data_subnet" {
  count                   = length(var.subnets)
  vpc_id                  = var.vpc_id  # aws_vpc.module.id
  cidr_block              = var.subnets[count.index].cidr
  availability_zone       = var.subnets[count.index].az
  map_public_ip_on_launch = false

  tags = {
    Name = "heliostech pivate data subnet ${count.index}"
  }
}

# # create public subnet
# resource "aws_subnet" "heliostech_public_subnet" {
#   count                   = "${var.count_subnet}"
#   vpc_id                  = var.vpc_id
#   cidr_block              = "10.0.${count.index+1}.0/24"
#   availability_zone       = data.aws_availability_zones.available.names[count.index]
#   map_public_ip_on_launch = true

#   tags      = {
#     Name    = "heliostech public subnet ${count.index}"
#   }
# }

# # create route table and add public route
# resource "aws_route_table" "public_route_table" {
#   vpc_id       = aws_vpc.vpc.id

#   route {
#     cidr_block = "0.0.0.0/0" 
#     gateway_id = aws_internet_gateway.internet_gateway.id
#   }

#   tags       = {
#     Name     = "public route table"
#   }
# }

# # associate public subnet az_01 to "public route table"
# resource "aws_route_table_association" "public_subnet_az_01_route_table_association" {
#   subnet_id           = aws_subnet.public_subnet_az_01.id
#   route_table_id      = aws_route_table.public_route_table.id
# }

# # associate public subnet az_02 to "public route table"
# resource "aws_route_table_association" "public_subnet_az_02_route_table_association" {
#   subnet_id           = aws_subnet.public_subnet_az_02.id
#   route_table_id      = aws_route_table.public_route_table.id
# }

# # create private app subnet
# resource "aws_subnet" "heliostech_private_app_subnet" {
#   count                   = "${var.count_subnet}"
#   vpc_id                  = var.vpc_id
#   cidr_block              = "10.0.${count.index+3}.0/24"
#   availability_zone       = data.aws_availability_zones.available_zones.names[count.index]
#   map_public_ip_on_launch = false

#   tags      = {
#     Name    = "heliostech private app subnet ${count.index}"
#   }
# }


# # create private data subnet
# resource "aws_subnet" "heliostech_private_data_subnet" {
#   count                   = "${var.count_subnet}"
#   vpc_id                  = var.vpc_id
#   cidr_block              = "10.0.${count.index+5}.0/24"
#   availability_zone       = data.aws_availability_zones.available_zones.names[count.index]
#   map_public_ip_on_launch = false

#   tags      = {
#     Name    = "heliostech private data subnet ${count.index}"
#   }
# }
