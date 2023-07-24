# This file is for demonstrating that apply_on_plan.sh is possible by generating an S3 bucket
provider "aws" {
  region = "us-east-1"
}

resource "random_string" "random_name" {
  length    = 8
  min_lower = 8
}


resource "aws_s3_bucket" "bucket" {
  bucket = "remove-this-test-bucket-${random_string.random_name.result}"

  tags = {
    Name        = "Remove-This"
    Environment = "Test-Env"
  }
}

output "bucket_name" {
  description = "The name of the S3 bucket"
  value       = aws_s3_bucket.bucket.id
}
