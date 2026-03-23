locals {
  azs = slice(data.aws_availability_zones.available.names, 0, 3)
  tags = merge(
    {
      env                 = var.environment
      app                 = var.app
      owner               = var.owner
      data-classification = var.data_classification
    },
    var.extra_tags
  )
}

module "vpc" {
  source = "../../../modules/vpc-baseline"

  name                 = "${var.name_prefix}-${var.environment}"
  vpc_cidr             = var.vpc_cidr
  azs                  = local.azs
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  enable_nat_gateway   = var.enable_nat_gateway
  tags                 = local.tags
}
