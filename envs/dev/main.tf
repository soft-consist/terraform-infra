provider "aws" {
  region = var.region
}

module "vpc" {
  source          = "git::https://github.com/soft-consist/terraform-modules.git//modules/vpc?ref=main"
  env             = var.env
  cidr_block      = var.cidr_block
  tags            = var.tags
  region          = var.region
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  azs             = var.azs
}

# module "eks" {
#   source              = "git::https://github.com/soft-consist/terraform-modules.git//modules/eks?ref=main"
#   env                 = var.env
#   cluster_name        = var.cluster_name
#   cluster_version     = var.cluster_version
#   vpc_id              = module.vpc.aws_vpc
#   private_subnet_ids  = module.vpc.private_subnet_ids
#   tags                = var.tags
#   desired_size        = var.desired_size
#   max_size            = var.max_size
#   min_size            = var.min_size
#   node_instance_types = var.node_instance_types
#   allowd_cidr_blocks  = var.allowd_cidr_blocks