terraform {
  backend "s3" {
    bucket = "pvt-terraform-poc"
    key    = "prod-state"
    region = "sa-east-1"
  }
}

module "vpc" {
  source = "../module/vpc"
}

# module "sg" {
#   source = "../module/sg"
# }