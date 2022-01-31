resource "aws_instance" "blue-green-deployment-blue" {
  count                  = var.enable_blue_env ? var.blue_instance_count : 0
  ami                    = data.aws_ami.amzlinux.id
  instance_type          = var.instance_type
  subnet_id              = element(local.subnets, count.index)
  vpc_security_group_ids = [aws_security_group.blue-green-deployment.id]

     user_data = templatefile("./apache-script.sh", {
    file_content = "blue version 1.2 - ${count.index}"
  })

  tags = {
    Name                  = "Blue/Green Deployment ${count.index + 1} (v${var.infrastructure_version})"
    InfrastructureVersion = var.infrastructure_version
  }
}

resource "aws_lb_target_group" "blue-green-deployment-blue" {
  name     = "blue-tg-blue-v${var.infrastructure_version}"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.blue-green-deployment.id

  health_check {
    port     = 80
    protocol = "HTTP"
    timeout  = 5
    interval = 10
  }
}

resource "aws_lb_target_group_attachment" "blue-green-deployment-blue" {
  count            = length(aws_instance.blue-green-deployment-blue)
  target_group_arn = aws_lb_target_group.blue-green-deployment-blue.arn
  target_id        = aws_instance.blue-green-deployment-blue[count.index].id
  port             = 80
}
