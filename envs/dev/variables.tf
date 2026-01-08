variable "cidr_block" {
  description = "The CIDR block for the VPC"
  type = string
}

variable "env" {
  description = "Environment name"
    type = string
}

variable "tags" {
  description = "Tags to apply to the VPC"
  type = map(string)
}

variable "region" {
  type = string
  default = "ap-northeast-2"
}