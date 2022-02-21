terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "eu-west-2"
}


resource "random_string" "suffix" {
  length  = 8
  number  = true
  lower = false
  upper = false
  special = false
}

resource "aws_s3_bucket" "b" {
  bucket = "my-tf-bucket-${random_string.suffix.result}"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

