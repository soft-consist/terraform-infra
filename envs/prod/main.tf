provider "aws" {
  region = var.region
}

module "vpc" {
  source          = "git::https://github.com/soft-consist/terraform-modules.git//modules/vpc?ref=v9.0"
  env             = var.env
  cidr_block      = var.cidr_block
  tags            = var.tags
  region          = var.region
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  azs             = var.azs
}

module "eks" {
  source             = "git::https://github.com/soft-consist/terraform-modules.git//modules/eks?ref=v9.0"
  env                = var.env
  cluster_name       = var.cluster_name
  cluster_version    = var.cluster_version
  vpc_id             = module.vpc.aws_vpc
  private_subnet_ids = module.vpc.private_subnet_ids
  tags               = var.tags
}