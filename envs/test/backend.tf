terraform {
  backend "s3" {
    bucket         = "my-terraform-state-ashu-abc"
    key            = "test-terraform.tfstate"
    region         = "ap-northeast-2"
    dynamodb_table = "test-terraform-locks"
    encrypt        = true
  }
}