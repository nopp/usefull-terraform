provider "aws" {
  region = "us-east-2"
}

terraform {
  backend "s3" {
    bucket = "pvt-terraform-poc"
    key    = "us-east-2/dynamodb"
    region = "sa-east-1"
  }
}

module "dynamodb" {
  source = "../module/dynamodb"
}