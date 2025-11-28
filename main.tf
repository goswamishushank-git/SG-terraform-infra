terraform {
  required_version = ">= 1.3.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "SG-terraform-vpc"
  }
}


resource "aws_instance" "example" {
  ami           = "ami-0ecb62995f68bb549"
  instance_type = "t2.micro"

  tags = {
    Name = "SG-HelloWorld"
  }



resource "aws_s3_bucket" "secure" {
  bucket = "sg-test"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = {
    Name = "SG-terraform-bucket"
  }
}
