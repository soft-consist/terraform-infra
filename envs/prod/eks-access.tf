# resource "aws_eks_access_entry" "github_actions" {
#   cluster_name  = module.eks.cluster_name
#   principal_arn = "arn:aws:iam::358871393576:role/github-actions-terraform-role"
#   type          = "STANDARD"
# }

# resource "aws_eks_access_policy_association" "github_actions_admin" {
#   cluster_name  = module.eks.cluster_name
#   principal_arn = aws_eks_access_entry.github_actions.principal_arn
#   policy_arn    = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"

#   access_scope {
#     type = "cluster"
#   }
# }