# module "vpc" {
#   source          = "git::https://github.com/soft-consist/terraform-modules.git//modules/vpc?ref=v9.0.35"
#   env             = var.env
#   region          = var.region
#   cidr_block      = var.cidr_block
#   azs             = var.azs
#   public_subnets  = var.public_subnets
#   private_subnets = var.private_subnets
#   tags            = var.tags
# }

# module "eks" {
#   source              = "git::https://github.com/soft-consist/terraform-modules.git//modules/eks?ref=v9.0.35"
#   env                 = var.env
#   vpc_id              = module.vpc.aws_vpc
#   cluster_name        = var.cluster_name
#   cluster_version     = var.cluster_version
#   private_subnet_ids  = module.vpc.private_subnet_ids
#   desired_size        = var.desired_size
#   max_size            = var.max_size
#   min_size            = var.min_size
#   node_instance_types = var.node_instance_types
#   allowd_cidr_blocks  = var.allowd_cidr_blocks
#   tags                = var.tags
#   depends_on          = [module.vpc]
# }

# module "addons" {
#   source             = "git::https://github.com/soft-consist/terraform-modules.git//modules/addons?ref=v9.0.35"
#   cluster_name       = module.eks.cluster_name
#   cni_version        = var.cni_version
#   coredns_version    = var.coredns_version
#   kube_proxy_version = var.kube_proxy_version
# }

# # module "eks-access" {
# #   source         = "git::https://github.com/soft-consist/terraform-modules.git//modules/eks-access?ref=v9.0.36"
# #   cluster_name   = var.cluster_name
# #   access_entries = var.access_entries
# #   depends_on     = [data.aws_eks_cluster.eks]
# # }

# # # module "argocd" {
# # #   source         = "git::https://github.com/soft-consist/terraform-modules.git//modules/argocd?ref=v9.0.37"
# # #   cluster_name   = var.cluster_name
# # #   values         = [file("${path.module}/argocd-values.yaml")]
# # #   bootstrap_file = "${path.module}/argocd-bootstrap.yaml"
# # #   depends_on     = [data.aws_eks_cluster.eks]
# # # }