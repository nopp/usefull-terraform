output "VPC_id" {
  value = aws_vpc.VPC.id
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

output "DB-ZC_id" {
  value = aws_subnet.DB-ZC.id
}