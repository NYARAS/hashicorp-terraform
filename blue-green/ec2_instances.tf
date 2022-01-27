locals {
  subnets = [aws_subnet.blue-green-deployment.*.id]

  user_data = <<EOF
    #cloud-config
    runcmd:
    - docker run -d -p 80:80 nginx:latest
  EOF
}

resource "aws_instance" "blue-green-deployment" {
  count                  = 3
  ami                    = ""
  instance_type          = var.instance_type
  subnet_id              = element(local.subnets, count.index)
  vpc_security_group_ids = [aws_security_group.blue-green-deployment.id]
  key_name               = aws_key_pair.blue-green-deployment.key_name

  user_data = local.user_data

  tags = {
    Name                  = "Blue/Green Deployment ${count.index + 1} (v${var.infrastructure_version})"
    InfrastructureVersion = var.infrastructure_version
  }
}