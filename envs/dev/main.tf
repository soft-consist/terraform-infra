provider "aws" {
  region = var.region
}

module "vpc" {
  source         = "../../modules/vpc"
  env            = var.env
  cidr_block     = var.cidr_block
  tags           = var.tags
  region         = var.region
  public_subnets = var.public_subnets
  azs            = var.azs
}