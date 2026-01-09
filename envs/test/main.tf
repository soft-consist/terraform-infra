provider "aws" {
  region = var.region
}

module "vpc" {
  source          = "git::https://github.com/soft-consist/terraform-modules.git//modules/vpc?ref=main"
  env             = var.env
  cidr_block      = var.cidr_block
  tags            = var.tags
  region          = var.region
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  azs             = var.azs
}