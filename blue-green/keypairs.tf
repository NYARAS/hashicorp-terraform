resource "aws_key_pair" "blue-green-deployment" {
  key_name   = "blue-green-deployment-v${var.infrastructure_version}"
  public_key = file("keypairs/blue-green-keypair.pub")
}