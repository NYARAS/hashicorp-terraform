# Input variable definitions

## Create Variable for S3 Bucket Name
variable "my_s3_bucket" {
  description = "S3 Bucket name that we pass to S3 Custom Module"
  type        = string
  default     = "mybucket-1047"
}

## Create Variable for S3 Bucket Tags
variable "my_s3_tags" {
  description = "Tags to set on the bucket"
  type        = map(string)
  default = {
    Terraform   = "true"
    Environment = "dev"
    newtag1     = "tag1"
    newtag2     = "tag2"
  }
}

variable "aws_region" {
  description = "Region in which AWS resources to be created"
  type        = string
  default     = "eu-west-1"
}
