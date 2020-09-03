data "terraform_remote_state" "vpcinfo" {
  backend = "s3"
  config = {
    bucket = var.VPC.Bucket
    key    = var.VPC.Key
    region = "sa-east-1"
  }
}

resource "aws_security_group" "frontend" {
  name        = "SG-FE"
  description = "SG-FE"
  vpc_id      = data.terraform_remote_state.vpcinfo.outputs.VPC_id

  ingress {
    description = "HTTP to any source"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS to any source"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "SG-FE"
  }
}

resource "aws_security_group" "ssh" {
  name        = "SG-SSH"
  description = "SG-SSH"
  vpc_id      = data.terraform_remote_state.vpcinfo.outputs.VPC_id

  ingress {
    description = "SSH to office source"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/8"] # Office CIDR
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "SG-SSH"
  }
}