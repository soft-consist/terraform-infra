env        = "test"
cidr_block = "10.0.0.0/16"
tags = {
  "name" = "dev"
}
azs             = ["us-west-2a", "us-west-2b", "us-west-2c"]
public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnets = ["10.0.11.0/24", "10.0.12.0/24"]
region = "us-west-2"