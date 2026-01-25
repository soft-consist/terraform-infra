variable "region" {
  type = string
}

#  variable "cidr_block" {
#    description = "The CIDR block for the VPC"
#    type        = string
#  }

#  variable "env" {
#    description = "Environment name"
#    type        = string
#  }

#  variable "tags" {
#    description = "Tags to apply to the VPC"
#    type        = map(string)
#  }

#  variable "public_subnets" {
#    description = "Public Subnets"
#    type        = list(string)
#  }

#  variable "azs" {
#    description = "Availabilty Zone"
#    type        = list(string)
#  }

#  variable "private_subnets" {
#    description = "Private Subnets"
#    type        = list(string)
#  }

#  variable "cluster_name" {
#    description = "EKS Cluster Name"
#    type        = string
#  }

#  variable "cluster_version" {
#    description = "EKS Cluster Version"
#    type        = string
#  }

#  variable "vpc_id" {
#    description = "VPC ID"
#    type        = string
#    default     = ""
#  }

#  variable "private_subnet_ids" {
#    description = "Private Subnets IDs"
#    type        = list(string)
#    default     = []
#  }

#  variable "desired_size" {
#    description = "Desired size of the node group"
#    type        = number
#    default     = 2
#  }

#  variable "max_size" {
#    description = "Maximum size of the node group"
#    type        = number
#    default     = 4
#  }

#  variable "min_size" {
#    description = "Minimum size of the node group"
#    type        = number
#    default     = 1
#  }

#  variable "node_instance_types" {
#    description = "Instance types for the node group"
#    type        = list(string)
#  }

#  variable "allowd_cidr_blocks" {
#    description = "Allowed CIDR blocks for access"
#    type        = list(string)
#    default     = []
#  }

#  variable "public_subnet_ids" {
#    description = "Public Subnets IDs"
#    type        = list(string)
#    default     = []
#  }

#  variable "bastion_assume_role_principals" {
#    description = "List of IAM principals allowed to assume the bastion role"
#    type        = list(string)
#    default     = []
#  }

# variable "cni_version" {
#   type = string
# }

# variable "coredns_version" {
#   type = string
# }

# variable "kube_proxy_version" {
#   type = string
# }

# variable "efs_csi_driver_version" {
#   type = string
# }

# variable "ebs_csi_driver_version" {
#   type = string
# }

# variable "service_account" {
#   type = string
# }