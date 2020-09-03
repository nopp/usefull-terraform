provider "aws" {
  region = "us-east-2"
}

terraform {
  backend "s3" {
    bucket = "pvt-terraform-poc"
    key    = "us-east-2/rds"
    region = "sa-east-1"
  }
}

module "rds" {
  source = "../module/rds"
}