provider "aws" {
  region = var.aws_region

  default_tags {
    tags = merge(
      {
        env                 = var.environment
        app                 = var.app
        owner               = var.owner
        data-classification = var.data_classification
        repo                = "platform-iac-env"
        layer               = "10-vpc"
        managed-by          = "terraform"
      },
      var.extra_tags
    )
  }
}
