output "aws_vpc" {
  value = module.vpc.aws_vpc
}

output "region" {
  value = var.region
}

output "private_subnet_ids" {
  value = module.vpc.private_subnet_ids
}

output "cluster_id" {
    value = module.eks.cluster_id
    description = "EKS Cluster ID"
}
