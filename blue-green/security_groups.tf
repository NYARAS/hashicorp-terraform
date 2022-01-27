resource "aws_security_group" "blue-green-deployment" {
  description = "Blue/Green Deployment"
  vpc_id = var.vpc_id
  name = "blue-green-deployment-v${var.infrastructure_version}"

  tags = {
      Name = "Blue/Green Deployment (v${var.infrastructure_version})"
  }
}

resource "aws_security_group_rule" "blue-green-deployment-inbound" {
  type = "ingress"
  security_group_id = aws_security_group.blue-green-deployment.id
  from_port = -1
  to_port = 0
  protocol = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "blue-green-deployment-outbound" {
  type = "egress"
  security_group_id = aws_security_group.blue-green-deployment.id
  from_port = -1
  to_port = 0
  protocol = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}
