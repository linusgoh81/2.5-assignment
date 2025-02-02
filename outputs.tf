output "dynamodb_table_name" {
  value = aws_dynamodb_table.example.name
  description = "Name of the DynamoDB table"
}