variable "VPC" {
    type = map
    default = {
        Name = "VPC-10-39"
        CIDR = "10.39.0.0/16"
        Region = "us-east-2"
        Env = "Prod"
    }
}

variable "SUBNETS" {
    type = map
    default = {
        FE-ZA = {
            Name = "FE-ZA"
            CIDR = "10.39.0.0/25"
            AZone = "us-east-2a"
        }
        FE-ZB = {
            Name = "FE-ZB"
            CIDR = "10.39.0.128/25"
            AZone = "us-east-2b"
        }
        FE-ZC = {
            Name = "FE-ZC"
            CIDR = "10.39.1.0/25"
            AZone = "us-east-2c"
        }
        DB-ZA = {
            Name = "BD-ZA"
            CIDR = "10.39.1.128/25"
            AZone = "us-east-2a"
        }
        DB-ZB = {
            Name = "BD-ZB"
            CIDR = "10.39.2.0/25"
            AZone = "us-east-2b"
        }
        DB-ZC = {
            Name = "BD-ZC"
            CIDR = "10.39.2.128/25"
            AZone = "us-east-2c"
        }
        BE-ZA = {
            Name = "BE-ZA"
            CIDR = "10.39.3.0/25"
            AZone = "us-east-2a"
        }
        BE-ZB = {
            Name = "BE-ZB"
            CIDR = "10.39.3.128/25"
            AZone = "us-east-2b"
        }
        BE-ZC = {
            Name = "BE-ZC"
            CIDR = "10.39.4.0/25"
            AZone = "us-east-2c"
        }
    }
}