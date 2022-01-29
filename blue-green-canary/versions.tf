terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }

  backend "s3" {
    bucket = "blue-green-for-learning-here" ## Bucket names should be unique globally
    key    = "v1"
    region = "eu-west-1"
  }
}

provider "aws" {
  profile = var.profile
  region  = var.aws_region
}
