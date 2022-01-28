resource "aws_elb" "blue-green-deployment" {
  name            = "Blue-Green-Deployment-v${var.infrastructure_version}"
  subnets         = aws_subnet.blue-green-deployment.*.id
  security_groups = [aws_security_group.blue-green-deployment.id]

  instances = aws_instance.blue-green-deployment.*.id

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }
  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 30
  }

  tags = {
    Name = "blue-Green-Deployment-v${var.infrastructure_version}"
  }

}