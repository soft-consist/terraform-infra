# VPC variables
cidr_block      = "12.0.0.0/16"
azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]
public_subnets  = ["12.0.1.0/24", "12.0.2.0/24", "12.0.3.0/24"]
private_subnets = ["12.0.11.0/24", "12.0.12.0/24", "12.0.13.0/24"]
region          = "us-east-1"

# EKS variables

cluster_name        = "Shared-cluster"
cluster_version     = "1.34"
desired_size        = 2
max_size            = 4
min_size            = 2
node_instance_types = ["t3.small"]
allowd_cidr_blocks  = ["12.0.0.0/16"]

# Addons variables

cni_version        = "v1.20.3-eksbuild.1"
coredns_version    = "v1.12.4-eksbuild.1"
kube_proxy_version = "v1.34.1-eksbuild.2"

# Commanly used variables

env = "dev-2"
tags = {
  "name" = "dev-2"
}

# EKS Access variables

access_entries = [
  {
    principal_arn = "arn:aws:iam::358871393576:role/github-actions-terraform-role"
    policy_arn    = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
  }
]