data "terraform_remote_state" "vpcinfo" {
  backend = "s3"
  config = {
    bucket = var.VPC.Bucket
    key    = var.VPC.Key
    region = "sa-east-1"
  }
}

resource "aws_security_group" "allow_ssh_internal" {
  name        = "SG-ALLOW-SG-INTERNAL"
  description = "SG-ALLOW-SG-INTERNAL"
  vpc_id      = data.terraform_remote_state.vpcinfo.outputs.VPC_id

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