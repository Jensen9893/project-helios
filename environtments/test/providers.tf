terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.0.1"
    }
  }
}

# configure aws provider
provider "aws" {
  region = var.region
  profile = "default"
}