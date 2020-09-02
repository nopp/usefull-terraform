variable "VPC" {
    type = map
    default = {
        Name = "VPC-10-39"
        CIDR = "10.39.0.0/16"
        Region = "us-east-1"
        Env = "Prod"
    }
}

variable "SUBNETS" {
    type = map
    default = {
        FE-ZA = {
            Name = "FE-ZA"
            CIDR = "10.39.0.0/25"
        }
        FE-ZB = {
            Name = "FE-ZB"
            CIDR = "10.39.0.128/25"
        }
        FE-ZC = {
            Name = "FE-ZC"
            CIDR = "10.39.1.0/25"
        }
        DB-ZA = {
            Name = "BD-ZA"
            CIDR = "10.39.1.128/25"
        }
        DB-ZB = {
            Name = "BD-ZB"
            CIDR = "10.39.2.0/25"
        }
        DB-ZC = {
            Name = "BD-ZC"
            CIDR = "10.39.2.128/25"
        }
        BE-ZA = {
            Name = "BE-ZA"
            CIDR = "10.39.3.0/25"
        }
        BE-ZB = {
            Name = "BE-ZB"
            CIDR = "10.39.3.128/25"
        }
        BE-ZC = {
            Name = "BE-ZC"
            CIDR = "10.39.4.0/25"
        }
    }
}