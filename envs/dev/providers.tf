provider "aws" {
  region = "us-east-1"
}

# # # While argocd commenting out comment out the below provider to avoid issues with kubectl and helm providers

# data "aws_eks_cluster" "eks" {
#   name = var.cluster_name
# }

# # data "aws_eks_cluster_auth" "eks" {
# #   name = var.cluster_name
# # }

# # provider "kubernetes" {
# #   host                   = data.aws_eks_cluster.eks.endpoint
# #   cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks.certificate_authority[0].data)
# #   exec {
# #     api_version = "client.authentication.k8s.io/v1beta1"
# #     command     = "aws"
# #     args = [
# #       "eks",
# #       "get-token",
# #       "--cluster-name",
# #       var.cluster_name
# #     ]
# #   }
# # }

# # provider "helm" {
# #   kubernetes {
# #     host                   = data.aws_eks_cluster.eks.endpoint
# #     cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks.certificate_authority[0].data)
# #     exec {
# #       api_version = "client.authentication.k8s.io/v1beta1"
# #       command     = "aws"
# #       args = [
# #         "eks",
# #         "get-token",
# #         "--cluster-name",
# #         var.cluster_name
# #       ]
# #     }
# #   }
# # }

# # provider "kubectl" {
# #   host                   = data.aws_eks_cluster.eks.endpoint
# #   cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks.certificate_authority[0].data)
# #   token                  = data.aws_eks_cluster_auth.eks.token
# #   load_config_file       = false
# # }