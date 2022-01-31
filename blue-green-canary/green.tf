resource "aws_instance" "blue-green-deployment-green" {
  count                  = var.enable_green_env ? var.green_instance_count : 0
  ami                    = data.aws_ami.amzlinux.id
  instance_type          = var.instance_type
  subnet_id              = element(local.subnets, count.index)
  vpc_security_group_ids = [aws_security_group.blue-green-deployment.id]

   user_data = templatefile("./apache-script.sh", {
    file_content = "green version 1.1 - ${count.index}"
  })

  tags = {
    Name                  = "Blue/Green Deployment ${count.index + 1} (v${var.infrastructure_version})"
    InfrastructureVersion = var.infrastructure_version
  }
}

resource "aws_lb_target_group" "blue-green-deployment-green" {
  name     = "blue-tg-green-v${var.infrastructure_version}"
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

resource "aws_lb_target_group_attachment" "blue-green-deployment-green" {
  count            = length(aws_instance.blue-green-deployment-green)
  target_group_arn = aws_lb_target_group.blue-green-deployment-green.arn
  target_id        = aws_instance.blue-green-deployment-green[count.index].id
  port             = 80
}
