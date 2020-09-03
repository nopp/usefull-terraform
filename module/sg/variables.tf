variable "VPC" {
    type = map
    default = {
        Name = "VPC-10-39"
        CIDR = "10.39.0.0/16"
        Region = "us-east-2"
        Env = "Prod"
    }
}