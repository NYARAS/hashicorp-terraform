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

# Resource Block
resource "aws_instance" "ec2demo" {
  ami           = "ami-04dd4500af104442f" # Amazon Linux in eu-west-1, update as per your region
  instance_type = "t2.micro"
}