#! /bin/bash
sudo yum update -y
sudo yum install -y httpd
sudo systemctl enable httpd
sudo service httpd start  
echo "<h1>Welcome to DevOps ! AWS Infra created using Terraform in eu-west-1 Region</h1>" | sudo tee /var/www/html/index.html