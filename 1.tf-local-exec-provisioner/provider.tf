terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.58.0"
    }
  }
backend "s3" {
  bucket = "docker1-remote-state"
  key = "remote-state"
  region = "us-east-1"
  dynamodb_table = "docker1-locking"
  }
}
provider "aws" {
  # Configuration options
  region = "us-east-1"
  
}
