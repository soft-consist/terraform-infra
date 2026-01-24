provider "aws" {
  region = var.region
}

# module "vpc" {
#    source          = "git::https://github.com/soft-consist/terraform-modules.git//modules/vpc?ref=v9.0.20"
#    env             = var.env
#    cidr_block      = var.cidr_block
#    tags            = var.tags
#    region          = var.region
#    public_subnets  = var.public_subnets
#    private_subnets = var.private_subnets
#    azs             = var.azs
#  }

#  module "eks" {
#    source              = "git::https://github.com/soft-consist/terraform-modules.git//modules/eks?ref=v9.0.20"
#    env                 = var.env
#    cluster_name        = var.cluster_name
#    cluster_version     = var.cluster_version
#    vpc_id              = module.vpc.aws_vpc
#    private_subnet_ids  = module.vpc.private_subnet_ids
#    tags                = var.tags
#    desired_size        = var.desired_size
#    max_size            = var.max_size
#    min_size            = var.min_size
#    node_instance_types = var.node_instance_types
#    allowd_cidr_blocks  = var.allowd_cidr_blocks
#    bastion_access_role_arn = module.bastion.bastion_access_role_arn
#  }

#  module "bastion" {
#    source = "git::https://github.com/soft-consist/terraform-modules.git//modules/bastion?ref=v9.0.20"
#    env    = var.env
#    tags             = var.tags
#    bastion_assume_role_principals = var.bastion_assume_role_principals
#  }

# module "addons" {
#   source = "git::https://github.com/soft-consist/terraform-modules.git//modules/addons?ref=v9.0.20"

#   cluster_name       = module.eks.cluster_name
#   cni_version        = var.cni_version
#   coredns_version    = var.coredns_version
#   kube_proxy_version = var.kube_proxy_version
# }