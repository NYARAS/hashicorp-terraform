resource "aws_instance" "my-ec2-vm" {
  ami           = "ami-04dd4500af104442f" # Amazon Linux in eu-west-1, update as per your region
  instance_type = "t2.micro"
  availability_zone = "eu-west-1a"
  #availability_zone = "eu-west-1b"
  tags = {
    "Name" = "web"
    #"tag1" = "Update-test-1"    
  }
}