# resource "kubernetes_config_map" "aws_auth" {
#   metadata {
#     name      = "aws-auth"
#     namespace = "kube-system"
#   }

#   data = {
#     mapRoles = yamlencode([
#       {
#         rolearn  = "arn:aws:iam::358871393576:role/prod-eks-node-role"
#         username = "system:node:{{EC2PrivateDNSName}}"
#         groups = [
#           "system:bootstrappers",
#           "system:nodes"
#         ]
#       },
#       {
#         rolearn  = "arn:aws:iam::358871393576:role/github-actions-terraform-role"
#         username = "github-actions"
#         groups = [
#           "system:masters"
#         ]
#       }
#     ])
#   }
# }
