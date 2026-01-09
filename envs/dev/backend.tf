terraform {
  backend "s3" {
    bucket         = "my-terraform-state-ashu-xyz"
    key            = "dev-terraform.tfstate"
    region         = "ap-northeast-2"
    dynamodb_table = "dev-terraform-locks"
    encrypt        = true
  }
}