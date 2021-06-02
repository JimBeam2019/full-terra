resource "aws_lambda_function" "func_get_member" {
  depends_on = [null_resource.lambda_get_member]

  function_name = "func-get-member"
  handler       = "index.handler"
  runtime       = "nodejs12.x"
  timeout       = "45"
  memory_size   = "512"
  filename      = "${local.codebase_path}/build/get_member/index.zip"

  role = aws_iam_role.lambda_exec.arn

  environment {
    variables = {
      PGHOST = module.aurora.this_rds_cluster_endpoint,
      PGPORT = module.aurora.this_rds_cluster_port,
      PGDB   = module.aurora.this_rds_cluster_database_name,
      PGUSER = module.aurora.this_rds_cluster_master_username,
      PGPASS = module.aurora.this_rds_cluster_master_password,
    }
  }

  publish = true
  vpc_config {
    subnet_ids         = module.vpc.private_subnets
    security_group_ids = [module.lambda_security_group.this_security_group_id]
  }
}

resource "aws_lambda_permission" "allow_api_get_member" {
  statement_id  = "AllowAPIgatewayInvokation"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.func_get_member.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "arn:aws:execute-api:${var.region}:${var.account_id}:${module.api_gateway_v2.this_apigatewayv2_api_id}/*/*/"
}