output "list_of_az" {
  value = data.aws_availability_zones.available[*].names
}

output "heliostech_public_subnet_id" {
  value = aws_subnet.heliostech_public_subnet[*].id
}

output "heliostech_private_app_subnet_id" {
  value = aws_subnet.heliostech_private_app_subnet[*].id
}

output "heliostech_private_data_subnet_id" {
  value = aws_subnet.heliostech_private_data_subnet[*].id
}

# output "internet_gateway" {
#   value = aws_internet_gateway.internet_gateway
# }