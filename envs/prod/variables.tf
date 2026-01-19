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

variable "region" {
  type = string
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

variable "cluster_name" {
  description = "EKS Cluster Name"
  type        = string
}

variable "cluster_version" {
  description = "EKS Cluster Version"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
  default     = ""
}

variable "private_subnet_ids" {
  description = "Private Subnets IDs"
  type        = list(string)
  default     = []
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

variable "bastion_ami" {}
variable "bastion_instance_type" {}
variable "bastion_key_name" {}

variable "allowed_ssh_cidr" {
  type = list(string)
}

variable "public_subnet_ids" {
  description = "Public Subnets IDs"
  type        = list(string)
  default     = []

}

# variable "eks_admin_role_arn" {
#   description = "IAM role ARN with full admin access to EKS"
#   type        = string
# }

# variable "eks_readonly_role_arn" {
#   description = "IAM role ARN with readonly access to EKS"
#   type        = string
#   default     = null
# }