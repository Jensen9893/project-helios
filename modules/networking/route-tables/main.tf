# create route table and add public route
resource "aws_route_table" "public_route_table" {
  vpc_id       = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0" 
    gateway_id = var.igw_id
  }

  tags       = {
    Name     = "public route table"
  }
}

# associate public subnet to "public route table"
resource "aws_route_table_association" "heliostech_public_subnet_route_table_association" {
  subnet_id           = "var.heliostech_public_subnet_id"
  route_table_id      = aws_route_table.public_route_table.id
}

# # associate public subnet az_02 to "public route table"
# resource "aws_route_table_association" "public_subnet_az_02_route_table_association" {
#   subnet_id           = aws_subnet.public_subnet_az_02.id
#   route_table_id      = aws_route_table.public_route_table.id
# }