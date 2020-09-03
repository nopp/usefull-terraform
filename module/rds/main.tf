data "terraform_remote_state" "vpcinfo" {
  backend = "s3"
  config = {
    bucket = var.VPC.Bucket
    key    = var.VPC.Key
    region = "sa-east-1"
  }
}

resource "aws_db_subnet_group" "DB-SUBNET" {
  name       = "db-subnet"
  subnet_ids = [
    data.terraform_remote_state.vpcinfo.outputs.DB-ZA_id, 
    data.terraform_remote_state.vpcinfo.outputs.DB-ZB_id, 
    data.terraform_remote_state.vpcinfo.outputs.DB-ZC_id
  ]

  tags = {
    Name = "DB-SUBNET"
  }
}

resource "aws_db_instance" "pgsql" {
  identifier            = "psql-case"
  name                  = "psql_case"
  engine                = "postgres"
  engine_version        = "9.6.16"
  instance_class        = "db.t2.micro"
  username              = "userx"
  password              = "123Password654"
  multi_az              = false
  publicly_accessible   = false
  storage_type          = "gp2"
  allocated_storage     = 20
  max_allocated_storage = 50
  parameter_group_name  = "default.postgres9.6"
  db_subnet_group_name  = aws_db_subnet_group.DB-SUBNET.name
}