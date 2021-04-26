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