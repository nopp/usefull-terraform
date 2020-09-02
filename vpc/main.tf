terraform {
  backend "s3" {
    bucket = "terraform-case-prod"
    key    = "vpc-state"
    region = "sa-east-1"
  }
}

module "vpc" {
  source = "../module/vpc"
}