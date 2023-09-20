locals {
  domainName = "${var.domainTag}${var.zoneName}"
  validationOptions = {
    for dvo in aws_acm_certificate.certificate.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }
}

data "aws_route53_zone" "zone" {
  name = var.zoneName
}

resource "aws_route53_record" "validation" {
  for_each = local.validationOptions

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = data.aws_route53_zone.zone.zone_id
}

resource "aws_acm_certificate" "certificate" {
  domain_name       = local.domainName
  validation_method = "DNS"
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_acm_certificate_validation" "certificateValidation" {
  certificate_arn         = aws_acm_certificate.certificate.arn
  validation_record_fqdns = [for dvo in aws_acm_certificate.certificate.domain_validation_options : dvo.resource_record_name]
}
