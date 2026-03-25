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

module "flow_logs" {
  source = "../../../modules/vpc-flow-logs"

  name           = "fintech1-demo1-${var.environment}"
  vpc_id         = data.terraform_remote_state.vpc.outputs.vpc_id
  retention_days = var.retention_days
  kms_key_arn     = var.kms_key_arn
  tags            = local.tags
}
