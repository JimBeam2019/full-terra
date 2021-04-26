module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = local.name
  cidr = var.cidr

  azs              = ["${local.region}a", "${local.region}b", "${local.region}c"]
  public_subnets   = var.public_subnets
  private_subnets  = var.private_subnets
  database_subnets = var.database_subnets

  enable_nat_gateway = false
  single_nat_gateway = true

  tags = local.tags
}