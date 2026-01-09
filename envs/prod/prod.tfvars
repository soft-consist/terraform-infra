env        = "prod"
cidr_block = "12.0.0.0/16"
tags = {
  "name" = "prod"
}
azs             = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
public_subnets  = ["12.0.1.0/24", "12.0.2.0/24", "12.0.3.0/24"]
private_subnets = ["12.0.11.0/24", "12.0.12.0/24", "12.0.13.0/24"]
region          = "eu-west-1"