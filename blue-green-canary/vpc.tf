resource "aws_vpc" "blue-green-deployment" {
    cidr_block = "10.0.0.0/16"
    enable_dns_support = true
    enable_dns_hostnames = true
    enable_classiclink = false
    instance_tenancy = "default"
}
