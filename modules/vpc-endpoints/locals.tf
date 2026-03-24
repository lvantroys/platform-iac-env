locals {
  default_interface_endpoints = {
    ssm         = { service = "com.amazonaws.${var.aws_region}.ssm",            private_dns_enabled = true }
    ssmmessages = { service = "com.amazonaws.${var.aws_region}.ssmmessages",    private_dns_enabled = true }
    ec2messages = { service = "com.amazonaws.${var.aws_region}.ec2messages",    private_dns_enabled = true }
    logs        = { service = "com.amazonaws.${var.aws_region}.logs",           private_dns_enabled = true }
    secrets     = { service = "com.amazonaws.${var.aws_region}.secretsmanager", private_dns_enabled = true }
    kms         = { service = "com.amazonaws.${var.aws_region}.kms",            private_dns_enabled = true }
  }

  effective_interface_endpoints = length(var.interface_endpoints) > 0 ? var.interface_endpoints : local.default_interface_endpoints
}
