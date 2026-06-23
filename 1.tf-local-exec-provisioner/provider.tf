terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.33.0" # Terraform AWS provider version
    }
  }
backend "s3" {
    bucket = "linga-devops-rs"
    key = "tf-local-exec-provisioner"
    region = "us-east-1"
    #dynamodb_table = "linga-devops-locking"
    use_lockfile = true
  }
}
provider "aws" {
  # Configuration options
  region = "us-east-1"
}