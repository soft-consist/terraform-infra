variable "region" {
  type = string
}

variable "cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "env" {
  description = "Environment name"
  type        = string
}

variable "tags" {
  description = "Tags to apply to the VPC"
  type        = map(string)
}

variable "public_subnets" {
  description = "Public Subnets"
  type        = list(string)
}

variable "azs" {
  description = "Availabilty Zone"
  type        = list(string)
}

variable "private_subnets" {
  description = "Private Subnets"
  type        = list(string)
}

# EKS variables

variable "cluster_name" {
  description = "EKS Cluster Name"
  type        = string
}

variable "cluster_version" {
  description = "EKS Cluster Version"
  type        = string
}

variable "desired_size" {
  description = "Desired size of the node group"
  type        = number
  default     = 2
}

variable "max_size" {
  description = "Maximum size of the node group"
  type        = number
  default     = 4
}

variable "min_size" {
  description = "Minimum size of the node group"
  type        = number
  default     = 1
}

variable "node_instance_types" {
  description = "Instance types for the node group"
  type        = list(string)
}

variable "allowd_cidr_blocks" {
  description = "Allowed CIDR blocks for access"
  type        = list(string)
  default     = []
}

# Addons variables

variable "cni_version" {
  type        = string
  description = "Version of the AWS VPC CNI plugin to install"
}

variable "coredns_version" {
  type        = string
  description = "Version of the CoreDNS plugin to install"
}

variable "kube_proxy_version" {
  type        = string
  description = "Version of the kube-proxy plugin to install"
}

# eks-access variables

variable "access_entries" {
  description = "List of IAM principals needing access"
  type = list(object({
    principal_arn = string
    policy_arn    = string
  }))
}