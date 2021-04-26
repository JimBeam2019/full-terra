module "api_gateway_v2" {
  source = "terraform-aws-modules/apigateway-v2/aws"

  name          = "Lambda Aurora"
  protocol_type = "HTTP"

  cors_configuration = {
    allow_headers = ["content-type", "x-amz-date", "authorization", "x-api-key", "x-amz-security-token", "x-amz-user-agent"]
    allow_methods = ["*"]
    allow_origins = ["*"]
  }

  create_api_domain_name = false

  integrations = {
    "ANY /" = {
      lambda_arn             = aws_lambda_function.func_get_member.arn
      payload_format_version = "2.0"
      timeout_milliseconds   = 12000
    }

    "ANY /init" = {
      lambda_arn             = aws_lambda_function.func_init.arn
      payload_format_version = "2.0"
      timeout_milliseconds   = 12000
    }

    "$default" = {
      lambda_arn = aws_lambda_function.func_get_member.arn
    }
  }

  vpc_links = {
    my-vpc = {
      name               = "my-vpc"
      security_group_ids = [module.vpc.default_security_group_id]
      subnet_ids         = module.vpc.public_subnets
    }
  }

  tags = {
    Name = "private-api"
  }
}