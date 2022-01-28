resource "aws_route_table" "blue-green-deployment" {
  vpc_id = var.vpc_id

  route {
    //associated subnet can reach everywhere
    cidr_block = "0.0.0.0/0"
    //CRT uses this IGW to reach internet
    gateway_id = aws_internet_gateway.blue-green-deployment.id
  }

  tags = {
    Name = "Blue/Green Deployment (v${var.infrastructure_version})"
  }
}

resource "aws_route_table_association" "blue-green-deployment" {
  count          = 3
  subnet_id      = element(local.subnets, count.index)
  route_table_id = aws_route_table.blue-green-deployment.id
}
