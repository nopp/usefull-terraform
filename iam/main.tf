provider "aws" {
  region = "us-east-2"
}

terraform {
  backend "s3" {
    bucket = "pvt-terraform-poc"
    key    = "us-east-2/iam"
    region = "sa-east-1"
  }
}

module "iam" {
  source = "../module/iam"
}