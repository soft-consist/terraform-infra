terraform {
  backend "s3" {
    bucket = "my-terraform-state-ashu-xyz"
    key    = "terraform.tfstate"
    region = "ap-northeast-2"
    dynamodb_table = "terraform-locks"
    encrypt = true
  }
}