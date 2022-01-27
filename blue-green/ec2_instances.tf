locals {
  subnets = [aws_subnet.blue-green-deployment.*.id]

  user_data = <<EOF
    #cloud-config
    runcmd:
    - docker run -d -p 80:80 nginx:latest
  EOF
}