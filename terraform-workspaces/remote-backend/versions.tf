# Terraform Settings Block
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      #version = "~> 3.21" # Optional but recommended in production
    }
  }
    # Adding Backend as S3 for Remote State Storage
  backend "s3" {
    bucket = "just-for-learning-here" ## Bucket names should be unique globally
    key    = "workspaces/terraform.tfstate"
    region = "eu-west-1" 

    # For State Locking
    dynamodb_table = "terraform-dev-state-table"     
  }
}

# Provider Block
provider "aws" {
  profile = "personal-deployment" # AWS Credentials Profile configured on your local desktop terminal  $HOME/.aws/credentials
  region  = var.aws_region
}