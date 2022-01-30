resource "aws_internet_gateway" "blue-green-deployment" {
  vpc_id = aws_vpc.blue-green-deployment.id
  tags = {
    Name = "Blue/Green Deployment (v${var.infrastructure_version})"
  }
}
