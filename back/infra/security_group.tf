module "api_gateway_security_group" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "sec-grp-vpc"
  description = "API Gateway Security Group"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["http-80-tcp"]

  egress_rules = ["all-all"]
}

module "lambda_security_group" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "lambda-sec-grp-vpc"
  description = "Lambda Security Group"
  vpc_id      = module.vpc.vpc_id

  computed_ingress_with_source_security_group_id = [
    {
      rule                     = "http-80-tcp"
      source_security_group_id = module.api_gateway_security_group.this_security_group_id
    }
  ]
  number_of_computed_ingress_with_source_security_group_id = 1

  egress_rules = ["all-all"]
}