aws_region          = "us-east-1"
environment         = "stage"
app                 = "platform-env"
owner               = "platform-team"
data_classification = "restricted"

tfstate_bucket = "fintech1-demo1-tfstate-us-east-1"
vpc_state_key  = "platform-iac-env/stage/10-vpc/terraform.tfstate"

extra_tags = {
  compliance = "regulated-finance"
}
