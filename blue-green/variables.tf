variable "aws_region" {
  description = "Region in which AWS resources to be created"
  type        = string
  default     = "eu-west-1"
}

variable "profile" {
  description = "AWS Credentials Profile configured on your local desktop terminal  $HOME/.aws/credentials"
  default     = "personal-deployment"
}

variable "infrastructure_version" {
  default = "1"
}

variable "vpc_id" {
  description = "The VPC ID of your AWS deployment infrastructure"
  default     = "your_vpc_id"
}