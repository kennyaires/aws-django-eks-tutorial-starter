module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 4.0.1"

  name = "${var.prefix}-vpc"
  cidr = "10.0.0.0/16"
  azs  = slice(data.aws_availability_zones.available.names, 0, 3)

  private_subnets  = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets   = ["10.0.10.0/24", "10.0.11.0/24", "10.0.12.0/24"]
  database_subnets = ["10.0.20.0/24", "10.0.21.0/24", "10.0.22.0/24"]

  enable_nat_gateway           = true # to access outside/ internet
  single_nat_gateway           = true # single one nat gateway to make it cheaper, ideally should have each one for each different zone
  enable_dns_hostnames         = true
  create_database_subnet_group = true

  # tags help kubernetes to identify the subnets
  public_subnet_tags = {
    "kubernetes.io/cluster/${var.prefix}-cluster" = "shared"
    "kubernetes.io/role/elb"                      = 1 # load balancer
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/${var.prefix}-cluster" = "shared"
    "kubernetes.io/role/elb"                      = 1 # load balancer
  }
}