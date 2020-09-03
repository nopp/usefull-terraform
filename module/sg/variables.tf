variable "VPC" {
    type = map
    default = {
        Key = "us-east-2/vpc"
        Bucket = "pvt-terraform-poc"
    }
}