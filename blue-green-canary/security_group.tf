resource "aws_security_group" "blue-green-deployment" {
  description = "Blue/Green Deployment"
  vpc_id      = aws_vpc.blue-green-deployment.id
  name        = "blue-green-deployment-v${var.infrastructure_version}"

  tags = {
    Name = "Blue/Green Deployment (v${var.infrastructure_version})"
  }
}

resource "aws_security_group_rule" "blue-green-deployment-inbound" {
  type              = "ingress"
  security_group_id = aws_security_group.blue-green-deployment.id
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "blue-green-deployment-outbound" {
  type              = "egress"
  security_group_id = aws_security_group.blue-green-deployment.id
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::/0"]
}
