variable "aws_region" { default = "us-east-1" }

variable "vpc_id" {}
variable "public_subnets" { type = list(string) }
variable "private_subnets" { type = list(string) }

variable "ami_id" {}
variable "key_name" {}

variable "db_username" {}
variable "db_password" {}
