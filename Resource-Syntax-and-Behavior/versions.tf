# Terraform Settings Block
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      #version = "~> 3.21" # Optional but recommended in production
    }
  }
}

# Provider Block
provider "aws" {
  profile = "personal-deployment" # AWS Credentials Profile configured on your local desktop terminal  $HOME/.aws/credentials
  region  = "eu-west-1"
}