output "lb_dns_name" {
  value = aws_lb.blue-green-deployment.dns_name
}

output "domain_name" {
  description = "Route53 DNS name"
  value = aws_route53_record.blue-green-deployment.name
}
