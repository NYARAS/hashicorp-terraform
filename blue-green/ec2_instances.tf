locals {
  subnets = aws_subnet.blue-green-deployment.*.id

  user_data = <<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum install httpd -y
    sudo systemctl enable httpd
    sudo systemctl start httpd
    echo "<h1>Welcome to Terraform Blue/Green Deployment! AWS Infra created using Terraform</h1>" > /var/www/html/index.html
    EOF
}

resource "aws_instance" "blue-green-deployment" {
  count                  = 3
  ami                    = data.aws_ami.amzlinux.id
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