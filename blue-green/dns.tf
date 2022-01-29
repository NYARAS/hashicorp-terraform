data "aws_route53_zone" "blue-green-deployment" {
  name = "${var.domain_name}."
}

resource "aws_route53_record" "blue-green-deployment" {
  zone_id = data.aws_route53_zone.blue-green-deployment.zone_id
  name    = "v${var.infrastructure_version}.${var.domain_name}"
  type    = "A"

  alias {
    name                   = "dualstack.${aws_elb.blue-green-deployment.dns_name}"
    zone_id                = aws_elb.blue-green-deployment.zone_id
    evaluate_target_health = false
  }
}
