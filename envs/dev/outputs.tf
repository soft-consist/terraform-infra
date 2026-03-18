output "aws_vpc" {
  value = module.vpc.aws_vpc
}

output "region" {
  value = var.region
}

output "private_subnet_ids" {
  value = module.vpc.private_subnet_ids
}

output "cluster_name" {
  description = "EKS Cluster Name"
  value       = module.eks.cluster_name
}

# aceess entries module

output "access_entries" {
  value = module.eks-access.access_entries
}