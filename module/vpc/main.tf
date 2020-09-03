### Provider
# provider "aws" {
#   region = var.VPC.Region
# }

### VPC
resource "aws_vpc" "VPC" {
  cidr_block                = var.VPC.CIDR
  enable_dns_hostnames      = true
  enable_dns_support        = true
  instance_tenancy          = "default"
  tags = {
    Environment = var.VPC.Env
    Name        = var.VPC.Name
  }
}

resource "aws_eip" "EIP-NATGW" {
  vpc = true
  depends_on = [aws_internet_gateway.IGW]
}

### NAT Gateway
resource "aws_nat_gateway" "NAT" {
  allocation_id = aws_eip.EIP-NATGW.id
  subnet_id     = aws_subnet.BE-ZA.id
  tags = {
    Name = format("NAT-%s", var.VPC.Name)
    Environment = var.VPC.Env
  }
}

### Internet Gateway
resource "aws_internet_gateway" "IGW" {
  vpc_id = aws_vpc.VPC.id
  tags = {
    Name = format("IGW-%s", var.VPC.Name)
    Environment = var.VPC.Env
  }
}

### Route table
resource "aws_route_table" "RT-NAT" {
  vpc_id = aws_vpc.VPC.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.NAT.id
  }

  tags = {
    Name = format("RT-NAT-%s", var.VPC.Name)
    Environment = var.VPC.Env
  }
}

resource "aws_route_table" "RT-IGW" {
  vpc_id = aws_vpc.VPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.IGW.id
  }

  tags = {
    Name = format("RT-IGW-%s", var.VPC.Name)
    Environment = var.VPC.Env
  }
}

### Subnets
resource "aws_subnet" "FE-ZA" {
  vpc_id                  = aws_vpc.VPC.id
  cidr_block              = var.SUBNETS.FE-ZA.CIDR
  availability_zone       = var.SUBNETS.FE-ZA.AZone
  map_public_ip_on_launch = false
  tags = {
    "Environment" = var.VPC.Env
    "Name"        = format("%s-%s", var.SUBNETS.FE-ZA.Name, var.VPC.Name)
    "Description" = "Frontend Zone A"
  }
}

resource "aws_subnet" "FE-ZB" {
  vpc_id                  = aws_vpc.VPC.id
  cidr_block              = var.SUBNETS.FE-ZB.CIDR
  availability_zone       = var.SUBNETS.FE-ZB.AZone
  map_public_ip_on_launch = false
  tags = {
    "Environment" = var.VPC.Env
    "Name"        = format("%s-%s", var.SUBNETS.FE-ZB.Name, var.VPC.Name)
    "Description" = "Frontend Zone B"
  }
}

resource "aws_subnet" "FE-ZC" {
  vpc_id                  = aws_vpc.VPC.id
  cidr_block              = var.SUBNETS.FE-ZC.CIDR
  availability_zone       = var.SUBNETS.FE-ZC.AZone
  map_public_ip_on_launch = false
  tags = {
    "Environment" = var.VPC.Env
    "Name"        = format("%s-%s", var.SUBNETS.FE-ZC.Name, var.VPC.Name)
    "Description" = "Frontend Zone C"
  }
}

resource "aws_subnet" "DB-ZA" {
  vpc_id                  = aws_vpc.VPC.id
  cidr_block              = var.SUBNETS.DB-ZA.CIDR
  availability_zone       = var.SUBNETS.DB-ZA.AZone
  map_public_ip_on_launch = false
  tags = {
    "Environment" = var.VPC.Env
    "Name"        = format("%s-%s", var.SUBNETS.DB-ZA.Name, var.VPC.Name)
    "Description" = "Database Zone A"
  }
}

resource "aws_subnet" "DB-ZB" {
  vpc_id                  = aws_vpc.VPC.id
  cidr_block              = var.SUBNETS.DB-ZB.CIDR
  availability_zone       = var.SUBNETS.DB-ZB.AZone
  map_public_ip_on_launch = false
  tags = {
    "Environment" = var.VPC.Env
    "Name"        = format("%s-%s", var.SUBNETS.DB-ZB.Name, var.VPC.Name)
    "Description" = "Database Zone B"
  }
}

resource "aws_subnet" "DB-ZC" {
  vpc_id                  = aws_vpc.VPC.id
  cidr_block              = var.SUBNETS.DB-ZC.CIDR
  availability_zone       = var.SUBNETS.DB-ZC.AZone
  map_public_ip_on_launch = false
  tags = {
    "Environment" = var.VPC.Env
    "Name"        = format("%s-%s", var.SUBNETS.DB-ZC.Name, var.VPC.Name)
    "Description" = "Database Zone C"
  }
}

resource "aws_subnet" "BE-ZA" {
  vpc_id                  = aws_vpc.VPC.id
  cidr_block              = var.SUBNETS.BE-ZA.CIDR
  availability_zone       = var.SUBNETS.BE-ZA.AZone
  map_public_ip_on_launch = false
  tags = {
    "Environment" = var.VPC.Env
    "Name"        = format("%s-%s", var.SUBNETS.BE-ZA.Name, var.VPC.Name)
    "Description" = "Backend Zone A"
  }
}

resource "aws_subnet" "BE-ZB" {
  vpc_id                  = aws_vpc.VPC.id
  cidr_block              = var.SUBNETS.BE-ZB.CIDR
  availability_zone       = var.SUBNETS.BE-ZB.AZone
  map_public_ip_on_launch = false
  tags = {
    "Environment" = var.VPC.Env
    "Name"        = format("%s-%s", var.SUBNETS.BE-ZB.Name, var.VPC.Name)
    "Description" = "Backend Zone B"
  }
}

resource "aws_subnet" "BE-ZC" {
  vpc_id                  = aws_vpc.VPC.id
  cidr_block              = var.SUBNETS.BE-ZC.CIDR
  availability_zone       = var.SUBNETS.BE-ZC.AZone
  map_public_ip_on_launch = false
  tags = {
    "Environment" = var.VPC.Env
    "Name"        = format("%s-%s", var.SUBNETS.BE-ZC.Name, var.VPC.Name)
    "Description" = "Backend Zone C"
  }
}

### Route Table association
resource "aws_route_table_association" "FE-ZA-IGW" {
  subnet_id      = aws_subnet.FE-ZA.id
  route_table_id = aws_route_table.RT-IGW.id
}

resource "aws_route_table_association" "FE-ZB-IGW" {
  subnet_id      = aws_subnet.FE-ZB.id
  route_table_id = aws_route_table.RT-IGW.id
}

resource "aws_route_table_association" "FE-ZC-IGW" {
  subnet_id      = aws_subnet.FE-ZC.id
  route_table_id = aws_route_table.RT-IGW.id
}

resource "aws_route_table_association" "DB-ZA-NAT" {
  subnet_id      = aws_subnet.DB-ZA.id
  route_table_id = aws_route_table.RT-NAT.id
}

resource "aws_route_table_association" "DB-ZB-NAT" {
  subnet_id      = aws_subnet.DB-ZB.id
  route_table_id = aws_route_table.RT-NAT.id
}

resource "aws_route_table_association" "DB-ZC-NAT" {
  subnet_id      = aws_subnet.DB-ZC.id
  route_table_id = aws_route_table.RT-NAT.id
}

resource "aws_route_table_association" "BE-ZA-NAT" {
  subnet_id      = aws_subnet.BE-ZA.id
  route_table_id = aws_route_table.RT-NAT.id
}

resource "aws_route_table_association" "BE-ZB-NAT" {
  subnet_id      = aws_subnet.BE-ZB.id
  route_table_id = aws_route_table.RT-NAT.id
}

resource "aws_route_table_association" "BE-ZC-NAT" {
  subnet_id      = aws_subnet.BE-ZC.id
  route_table_id = aws_route_table.RT-NAT.id
}

### IAM Role
resource "aws_iam_role" "EKS-ROLE" {
    name               = "EKS-ROLE"
    path               = "/"
    assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy" "EKS-ROLE-ASG" {
    name   = "EKS-ROLE-ASG"
    role   = aws_iam_role.EKS-ROLE.name
    policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "autoscaling:DescribeAutoScalingGroups",
        "autoscaling:DescribeAutoScalingInstances",
        "autoscaling:DescribeLaunchConfigurations",
        "autoscaling:DescribeTags",
        "autoscaling:SetDesiredCapacity",
        "autoscaling:TerminateInstanceInAutoScalingGroup",
        "ec2:DescribeLaunchTemplateVersions"
      ],
      "Resource": "*",
      "Effect": "Allow"
    }
  ]
}
POLICY
}

resource "aws_iam_policy_attachment" "EKS-ROLE-AmazonEKSServicePolicy" {
    name       = "EKS-ROLE-AmazonEKSServicePolicy"
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
    roles      = [aws_iam_role.EKS-ROLE.name]
}

resource "aws_iam_policy_attachment" "EKS-ROLE-AmazonEKSClusterPolicy" {
    name       = "EKS-ROLE-AmazonEKSClusterPolicy"
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
    roles      = [aws_iam_role.EKS-ROLE.name]
}