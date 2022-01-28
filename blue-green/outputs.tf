output "instance_public_ips" {
  description = "EC2 Instance Public IPs"
  value       = aws_instance.blue-green-deployment.*.public_ip
}

output "load_balancer_dns" {
  description = "ELB DNS name"
  value       = aws_elb.blue-green-deployment.dns_name
}