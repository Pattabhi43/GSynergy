terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.15.0"
    }
  }
}

provider "aws" {
  # Configuration options
  assume_role {
    role_arn = "arn:aws:iam::525567955121:role/Account-user"
  }
  region = "us-east-1"
}