### Provider
provider "aws" {
  region = var.VPC.Region
}

resource "aws_security_group" "allow_ssh_internal" {
  name        = "SG-ALLOW-SG-INTERNAL"
  description = "SG-ALLOW-SG-INTERNAL"
  vpc_id      = module.vpc.VPC_id

  ingress {
    description = "SSH from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/8"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "SG-ALLOW-SG-INTERNAL"
  }
}