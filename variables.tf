variable "aws_region" {
  type = string
  description = "AWS Region"
  default = "ap-southeast-1" # Replace with your AWS region
}

variable "s3_bucket" {
  type = string
  description = "S3 Bucket for Terraform State"
  default = "linus_new_bucket" # Replace with your bucket name
}