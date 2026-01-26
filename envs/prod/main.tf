module "vpc" {
  source          = "git::https://github.com/soft-consist/terraform-modules.git//modules/vpc?ref=v9.0.27"
  env             = var.env
  cidr_block      = var.cidr_block
  tags            = var.tags
  region          = var.region
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  azs             = var.azs
}

module "eks" {
  source                  = "git::https://github.com/soft-consist/terraform-modules.git//modules/eks?ref=v9.0.27"
  env                     = var.env
  cluster_name            = var.cluster_name
  cluster_version         = var.cluster_version
  vpc_id                  = module.vpc.aws_vpc
  private_subnet_ids      = module.vpc.private_subnet_ids
  tags                    = var.tags
  desired_size            = var.desired_size
  max_size                = var.max_size
  min_size                = var.min_size
  node_instance_types     = var.node_instance_types
  allowd_cidr_blocks      = var.allowd_cidr_blocks
  bastion_access_role_arn = module.bastion.bastion_access_role_arn
}

module "bastion" {
  source                         = "git::https://github.com/soft-consist/terraform-modules.git//modules/bastion?ref=v9.0.27"
  env                            = var.env
  tags                           = var.tags
  bastion_assume_role_principals = var.bastion_assume_role_principals
}

module "addons" {
  source             = "git::https://github.com/soft-consist/terraform-modules.git//modules/addons?ref=v9.0.27"
  cluster_name       = module.eks.cluster_name
  cni_version        = var.cni_version
  coredns_version    = var.coredns_version
  kube_proxy_version = var.kube_proxy_version
  # ebs_csi_role_arn = module.irsa.role_arn
  # efs_csi_driver_version   = var.efs_csi_driver_version
  # ebs_csi_driver_version   = var.ebs_csi_driver_version
}

module "argocd" {
  source       = "git::https://github.com/soft-consist/terraform-modules.git//modules/argocd?ref=v9.0.34"
  cluster_name = module.eks.cluster_name
  values = [
    file("${path.module}/argocd-values.yaml")
  ]
  bootstrap_file = "${path.module}/argocd-bootstrap.yaml"
}

# module "irsa" {
#   source = "git::https://github.com/soft-consist/terraform-modules.git//modules/irsa?ref=v9.0.24"
#   role_name       = "${var.env}-irsa-role"
#   oidc_provider_arn   = module.eks.oidc_provider_arn
#   oidc_provider_url   = module.eks.oidc_provider_url
#   namespace       = "kube-system"
#   service_account = var.service_account
#   policy_arns    = [
#     "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
#   ]
#   tags = var.tags
# }