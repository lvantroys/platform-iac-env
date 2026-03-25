data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = var.tfstate_bucket
    key    = var.vpc_state_key
    region = var.aws_region
  }
}
