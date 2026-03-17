data "aws_eks_cluster" "eks" {
  name = data.terraform_remote_state.eks.outputs.cluster_name
}

module "eks-access" {
  source         = "git::https://github.com/soft-consist/terraform-modules.git//modules/eks-access?ref=v9.0.36"
  cluster_name   = var.cluster_name
  access_entries = var.access_entries
# depends_on     = [data.aws_eks_cluster.eks]
}
