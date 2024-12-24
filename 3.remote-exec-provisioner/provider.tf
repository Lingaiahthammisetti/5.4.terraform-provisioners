terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.58.0"
    }
  }
backend "s3" {
  bucket ="tf-provisioners-remote-state"
  key="tf-provisioners-key"
  region="us-east-1"
  dynamodb_table="tf-provisioners-remote-state-locking"
  }
}
provider "aws" {
  # Configuration options
  region = "us-east-1"
}

