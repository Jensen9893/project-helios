output "project_name" {
  value = var.project_name
}

output "igw_id" {
  value = aws_internet_gateway.internet_gateway.id
}