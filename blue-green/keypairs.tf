resource "aws_key_pair" "blue-green-deployment" {
  key_name = "blue-green-deployment-v${var.infrastructure_version}"
  public_key = "${file("blue-green-keypair.pub")}"
}