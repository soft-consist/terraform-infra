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

output "cluster_ca_certificate" {
  description = "Cluster certificate"
  value       = module.eks.cluster_ca_certificate
}

output "cluster_endpoint" {
  description = "EKS Cluster Endpoint"
  value       = module.eks.cluster_endpoint
}

output "oidc_provider_url" {
  value = module.eks.oidc_provider_url
}

output "oidc_provider_arn" {
  value = module.eks.oidc_provider_arn
}

output "cluster_ca" {
  description = "EKS Cluster CA"
  value       = module.eks.cluster_ca
}

output "public_subnet_ids" {
  value = module.vpc.public_subnet_ids
}

output "bastion_access_role_arn" {
  value = module.bastion.bastion_access_role_arn
}