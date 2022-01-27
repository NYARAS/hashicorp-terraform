output "instance_public_ips" {
  description = "EC2 Instance Public IPs"
  value       = aws_instance.blue-green-deployment.*.public_ip
}