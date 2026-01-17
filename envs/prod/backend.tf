terraform {
  backend "s3" {
    bucket         = "my-terraform-state-ashu-abc"
    key            = "prod-terraform.tfstate"
    region         = "ap-northeast-2"
    dynamodb_table = "prod-terraform-locks"
    encrypt        = true
  }
}