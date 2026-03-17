# eks-access variables

variable "access_entries" {
  description = "List of IAM principals needing access"
  type = list(object({
    principal_arn = string
    policy_arn    = string
  }))
}