# EKS Access variables

access_entries = [
  {
    principal_arn = "arn:aws:iam::358871393576:role/github-actions-terraform-role"
    policy_arn    = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
  }
]

# common variables

env = "dev-1"
tags = {
  "name" = "dev-1"
}