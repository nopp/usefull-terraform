output "VPC_id" {
  value = aws_vpc.VPC.id
}

data "aws_subnet_ids" "subnets" {
  # depends_on = [
  #   aws_subnet.FE-ZA,
  #   aws_subnet.FE-ZB,
  #   aws_subnet.FE-ZC,
  #   aws_subnet.BE-ZA,
  #   aws_subnet.BE-ZB,
  #   aws_subnet.BE-ZC,
  #   aws_subnet.DB-ZA,
  #   aws_subnet.DB-ZB,
  #   aws_subnet.DB-ZC,
  # ]
  vpc_id = aws_vpc.VPC.id
}

# data "aws_subnet" "subnets" {
#   # depends_on = [data.aws_subnet_ids.subnets]
#   for_each = data.aws_subnet_ids.subnets.ids
#   id       = each.value
# }

output "SUBNET_list" {
  value = [for s in data.aws_subnet_ids.subnets : s]
}

output "FE-ZA_id" {
  value = aws_subnet.FE-ZA.id
}

output "FE-ZB_id" {
  value = aws_subnet.FE-ZB.id
}

output "FE-ZC_id" {
  value = aws_subnet.FE-ZC.id
}

output "BE-ZA_id" {
  value = aws_subnet.BE-ZA.id
}

output "BE-ZB_id" {
  value = aws_subnet.BE-ZB.id
}

output "BE-ZC_id" {
  value = aws_subnet.BE-ZC.id
}

output "DB-ZA_id" {
  value = aws_subnet.DB-ZA.id
}

output "DB-ZB_id" {
  value = aws_subnet.DB-ZB.id
}

output "DB-ZC_id" {
  value = aws_subnet.DB-ZC.id
}
