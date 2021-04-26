resource "null_resource" "lambda_get_member" {
  provisioner "local-exec" {
    working_dir = local.codebase_path
    command     = "yarn run pack-get-member-handler"
  }
}

resource "null_resource" "lambda_init" {
  provisioner "local-exec" {
    working_dir = local.codebase_path
    command     = "yarn run pack-init-handler"
  }
}

resource "null_resource" "run_lambda_init" {
  depends_on = [
    module.api_gateway_v2,
    module.aurora,
    aws_lambda_function.func_init
  ]

  provisioner "local-exec" {
    working_dir = local.codebase_path
    command     = "wget -qO - ${module.api_gateway_v2.this_apigatewayv2_api_api_endpoint}/init"
  }
}