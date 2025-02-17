terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.67.0"
    }
  }
  required_version = "1.5.4"
}

provider "aws" {
  region = var.region
}

data "aws_availability_zones" "available" {}
