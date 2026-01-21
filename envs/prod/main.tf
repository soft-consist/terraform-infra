provider "aws" {
  region = var.region
}

provider "kubernetes" {
  host                   = module.eks.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks.cluster_ca)

  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command     = "aws"
    args = [
      "eks",
      "get-token",
      "--cluster-name",
      module.eks.cluster_name
    ]
  }
}

module "vpc" {
  source          = "git::https://github.com/soft-consist/terraform-modules.git//modules/vpc?ref=v9.0.7"
  env             = var.env
  cidr_block      = var.cidr_block
  tags            = var.tags
  region          = var.region
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  azs             = var.azs
}

module "eks" {
  source              = "git::https://github.com/soft-consist/terraform-modules.git//modules/eks?ref=v9.0.9"
  env                 = var.env
  cluster_name        = var.cluster_name
  cluster_version     = var.cluster_version
  vpc_id              = module.vpc.aws_vpc
  private_subnet_ids  = module.vpc.private_subnet_ids
  tags                = var.tags
  desired_size        = var.desired_size
  max_size            = var.max_size
  min_size            = var.min_size
  node_instance_types = var.node_instance_types
  allowd_cidr_blocks  = var.allowd_cidr_blocks
  aws_auth_roles = [
    {
      rolearn  = "arn:aws:iam::358871393576:role/github-actions-terraform-role"
      username = "platform-admin"
      groups   = ["system:masters"]
    }
  ]

}

# module "bastion" {
#   source = "git::https://github.com/soft-consist/terraform-modules.git//modules/bastion?ref=main"
#   env    = var.env
#   vpc_id = module.vpc.aws_vpc
#   # ONE subnet only
#   public_subnet_ids = module.vpc.public_subnet_ids
#   ami           = var.bastion_ami
#   instance_type = var.bastion_instance_type
#   key_name      = var.bastion_key_name
#   allowed_ssh_cidr = var.allowed_ssh_cidr
#   tags             = var.tags
# }

