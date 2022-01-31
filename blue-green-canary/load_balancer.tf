resource "aws_lb" "blue-green-deployment" {
  name               = "Blue-Green-Deployment-v${var.infrastructure_version}"
  internal           = false
  load_balancer_type = "application"
  subnets            = aws_subnet.blue-green-deployment.*.id

  security_groups = [aws_security_group.blue-green-deployment.id]

  tags = {
    Name = "blue-Green-Deployment-v${var.infrastructure_version}"
  }
}

resource "aws_lb_listener" "blue-green-deployment" {
  load_balancer_arn = aws_lb.blue-green-deployment.arn
  port              = "80"
  protocol          = "HTTP"


  default_action {
    type = "forward"
    forward {
      target_group {
        arn    = aws_lb_target_group.blue-green-deployment-blue.arn
        weight = lookup(local.traffic_dist_map[var.traffic_distribution], "blue", 100)
      }

      target_group {
        arn    = aws_lb_target_group.blue-green-deployment-green.arn
        weight = lookup(local.traffic_dist_map[var.traffic_distribution], "green", 0)
      }

      stickiness {
        enabled  = false
        duration = 1
      }
    }
  }
}
