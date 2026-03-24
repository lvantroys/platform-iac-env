locals {
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

module "endpoints" {
  source = "../../../modules/vpc-endpoints"

  name                    = "fintech1-demo1-${var.environment}"
  aws_region              = var.aws_region
  vpc_id                  = data.terraform_remote_state.vpc.outputs.vpc_id
  vpc_cidr                = data.terraform_remote_state.vpc.outputs.vpc_cidr
  private_subnet_ids      = data.terraform_remote_state.vpc.outputs.private_subnet_ids
  private_route_table_ids = data.terraform_remote_state.vpc.outputs.private_route_table_ids

  tags = local.tags
}
