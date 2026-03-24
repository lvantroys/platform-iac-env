variable "aws_region" { type = string }
variable "environment" { type = string }
variable "app" { type = string }
variable "owner" { type = string }
variable "data_classification" { type = string }
variable "extra_tags" {
  type    = map(string)
  default = {}
}

variable "tfstate_bucket" { type = string }
variable "vpc_state_key" { type = string }
