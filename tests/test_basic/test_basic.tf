terraform {
  required_providers {
    test = {
      source = "terraform.io/builtin/test"
    }
  }
}

locals {
  zoneName  = file("${path.root}/zone_name.txt")
  domainTag = "test."
}

##### TESTS #####

module "basic" {
  source = "../../module"

  zoneName  = local.zoneName
  domainTag = local.domainTag
}

resource "test_assertions" "tests" {
  component = "basic"

  equal "domainName" {
    description = "domain name"
    got         = module.basic.certificate.domain_name
    want        = "${local.domainTag}${local.zoneName}"
  }
}
