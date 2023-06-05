variable "region" {
  default = "ap-east-1"
}

variable "vpc_cidr" {
  description = "CIDR block of the vpc"
  default     = "10.0.0.0/16"
}

variable "my_project" {
  description = "Name of the project"
  default     = "heliostech"
}

variable "public_subnets" {}
variable "private_app_subnets" {}
variable "private_data_subnets" {}
variable "zone_id" {}