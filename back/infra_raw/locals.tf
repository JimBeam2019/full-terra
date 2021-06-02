locals {
  name          = "postgresql"
  region        = var.region
  codebase_path = abspath("${path.module}/..")
  azs           = ["${var.region}a", "${var.region}b", "${var.region}c"]
  tags = {
    Owner       = "user"
    Environment = "dev"
  }
}