locals {
  name          = "postgresql"
  region        = var.region
  codebase_path = abspath("${path.module}/..")
  tags = {
    Owner       = "user"
    Environment = "dev"
  }
}