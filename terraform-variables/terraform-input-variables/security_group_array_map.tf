# Create Security Group -- Map
resource "aws_security_group" "vpc-ssh-new" {
  for_each        = var.security_groups_map
  name            = each.value
  description = "Allow ssh"
  ingress {
    description = "Allow port 22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    description = "Allow all IP and Ports outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/1"]
  }
}

# Create Security Group - Array
resource "aws_security_group" "vpc-web" {
  count = 4
  name     = element(var.security_groups_list, count.index)
  description = "Dev VPC Web"
  ingress {
    description = "Allow port 80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "Allow port 443"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    description = "Allow all IP and Ports outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/1"]
  }
}
