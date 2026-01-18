env        = "dev"
cidr_block = "12.0.0.0/16"
tags = {
  "name" = "dev-1"
}
azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]
public_subnets  = ["12.0.1.0/24", "12.0.2.0/24", "12.0.3.0/24"]
private_subnets = ["12.0.11.0/24", "12.0.12.0/24", "12.0.13.0/24"]
region          = "us-east-1"

cluster_name    = "Shared-cluster"
cluster_version = "1.34"