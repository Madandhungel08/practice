resource "aws_dynamodb_table" "dynamo_table" {
  name           = "dynamo-table-${var.env}"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "id"

  attribute {
    name = var.hash_key
    type = "S"
  }

  tags = {
    Name        = "dynamo-table-${var.env}"
    Environment = var.env
  }
}