env        = "prod"
cidr_block = "12.0.0.0/16"
tags = {
  "name" = "prod-1"
}
azs             = ["ap-northeast-2a", "ap-northeast-2b", "ap-northeast-2c"]
public_subnets  = ["12.0.1.0/24", "12.0.2.0/24", "12.0.3.0/24"]
private_subnets = ["12.0.11.0/24", "12.0.12.0/24", "12.0.13.0/24"]
region          = "ap-northeast-2"

cluster_name    = "Shared-cluster"
cluster_version = "1.34"

desired_size = 2
max_size     = 4
min_size     = 2

node_instance_types = ["t3.small"]
allowd_cidr_blocks  = ["12.0.0.0/16"]

bastion_assume_role_principals = [
  "arn:aws:iam::358871393576:user/Ashutosh-Bambal",
  "arn:aws:iam::358871393576:user/Kalyani-Bambal"
]

cni_version        = "v1.18.1-eksbuild.1"
coredns_version    = "v1.11.1-eksbuild.4"
kube_proxy_version = "v1.34.1-eksbuild.2"
