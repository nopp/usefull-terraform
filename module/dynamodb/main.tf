resource "aws_dynamodb_table" "ddb-table" {
  name             = "ddb-table"
  hash_key         = "id"
  billing_mode     = "PAY_PER_REQUEST"

  attribute {
    name = "id"
    type = "S"
  }

}