# Terraform AWS Certificate Module

For testing, make sure to include a `zone_name.txt` file in the test folder.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.17.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_acm_certificate.certificate](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate) | resource |
| [aws_acm_certificate_validation.certificateValidation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate_validation) | resource |
| [aws_route53_record.validation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_zone.zone](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route53_zone) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_domainTag"></a> [domainTag](#input\_domainTag) | Domain tag for the certificate. | `string` | n/a | yes |
| <a name="input_zoneName"></a> [zoneName](#input\_zoneName) | Name of the Route53 zone. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_certificate"></a> [certificate](#output\_certificate) | n/a |
| <a name="output_certificateValidation"></a> [certificateValidation](#output\_certificateValidation) | n/a |
<!-- END_TF_DOCS -->
