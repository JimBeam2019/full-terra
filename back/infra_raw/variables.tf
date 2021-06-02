variable "region" {
  description = "AWS Region"
  type        = string
}

variable "account_id" {
  description = "AWS Account ID"
}

variable "cidr" {
  description = "CIDR"
  type        = string
}

variable "public_subnets" {
  description = "Public subnets"
  type        = list(string)
}

variable "private_subnets" {
  description = "Private subnets"
  type        = list(string)
}

variable "database_subnets" {
  description = "Database subnets"
  type        = list(string)
}

variable "db_username" {
  description = "The username for the DB master user"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "Database Password"
  type        = string
}