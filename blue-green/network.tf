resource "aws_internet_gateway" "blue-green-deployment" {
  vpc_id = var.vpc_id
  tags = {
    Name = "Blue/Green Deployment (v${var.infrastructure_version})"
  }
}
