terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.58.0"
    }
  }
  backend "s3" {
    bucket ="lingadevops-local-remote-state"
    key = "local-remote-provisioner"
    region = "us-east-1"
    dynamodb_table="lingadevops-local-remote-state-locking"
  }
}
provider "aws" {
  # Configuration options
  region = "us-east-1"
}

