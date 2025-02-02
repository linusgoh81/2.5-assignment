terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0" # Or your preferred version
    }
  }
  backend "s3" {
    bucket = "linus_new_bucket" # Replace with your bucket name
    key    = "dynamodb-terraform/terraform.tfstate" # Path within the bucket
    region = "ap-southeast-1" # Replace with your AWS region
  }
}

provider "aws" {
  region = "ap-southeast-1" # Replace with your AWS region
}

resource "aws_dynamodb_table" "example" {
  name           = "MyDynamoDBTable" # Choose a name
  billing_mode   = "PAY_PER_REQUEST" # Or PROVISIONED

  attribute {
    name = "id" # Example primary key attribute
    type = "S" # String type
  }

  hash_key = "id" # Define the hash key

  # Optional: Add other attributes and indexes as needed
  # Example of a Global Secondary Index (GSI)
  global_secondary_index {
    name               = "gsi_example"
    hash_key           = "another_attribute" # Example
    projection_type    = "ALL" # Or KEYS_ONLY or INCLUDE
    write_capacity     = 5 # if PROVISIONED
    read_capacity      = 5 # if PROVISIONED
  }
}