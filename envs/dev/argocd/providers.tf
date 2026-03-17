# data "terraform_remote_state" "eks" {
#   backend = "s3"

#   config = {
#     bucket = "my-terraform-state"
#     key    = "dev/eks-infra.tfstate"
#     region = "us-east-1"
#   }
# }

# provider "kubernetes" {
#   host                   = data.terraform_remote_state.eks.outputs.cluster_endpoint
#   cluster_ca_certificate = base64decode(data.terraform_remote_state.eks.outputs.cluster_ca)

#   exec {
#     api_version = "client.authentication.k8s.io/v1beta1"
#     command     = "aws"
#     args        = [
#       "eks",
#       "get-token",
#       "--cluster-name",
#       data.terraform_remote_state.eks.outputs.cluster_name
#     ]
#   }
# }

# provider "helm" {
#   kubernetes {
#     host                   = data.terraform_remote_state.eks.outputs.cluster_endpoint
#     cluster_ca_certificate = base64decode(data.terraform_remote_state.eks.outputs.cluster_ca)

#     exec {
#       command = "aws"
#       args    = [
#         "eks",
#         "get-token",
#         "--cluster-name",
#         data.terraform_remote_state.eks.outputs.cluster_name
#       ]
#     }
#   }
# }

# provider "kubectl" {
#   host                   = data.terraform_remote_state.eks.outputs.cluster_endpoint
#   cluster_ca_certificate = base64decode(data.terraform_remote_state.eks.outputs.cluster_ca)
#   load_config_file       = false

#   exec {
#     command = "aws"
#     args    = [
#       "eks",
#       "get-token",
#       "--cluster-name",
#       data.terraform_remote_state.eks.outputs.cluster_name
#     ]
#   }
# }