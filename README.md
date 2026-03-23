# platform-iac-env

Platform-owned Terraform for environment networking (dev/stage/prod) in a single AWS account.
Each environment has its own VPC (3 AZs) and each stack folder has its own Terraform state.

## Stacks (per environment)
- `live/<env>/10-vpc`        : VPC, subnets, IGW, NAT (one per AZ), route tables
- `live/<env>/20-endpoints`  : VPC endpoints (S3/Dynamo gateway, SSM/Logs/Secrets/KMS interface endpoints)
- `live/<env>/30-flow-logs`  : VPC Flow Logs to CloudWatch Logs (optional KMS)

## Outputs for app repos
App repositories typically consume:
- `vpc_id`
- `public_subnet_ids`
- `private_subnet_ids`

from `live/<env>/10-vpc` state.

## CI/CD
This repo is designed for CI-only deployments using GitHub OIDC roles created by `platform-iac-core`.
Workflows in `.github/workflows/` are thin callers that invoke the central reusable workflows.

## Local usage (optional)
1) Copy `backend.hcl.example` -> `backend.hcl` in a stack folder (do not commit backend.hcl)
2) Copy `<env>.auto.tfvars.example` -> `<env>.auto.tfvars` (or use `-var-file`)
3) Run:
   terraform -chdir=live/dev/10-vpc init -reconfigure -backend-config=backend.hcl
   terraform -chdir=live/dev/10-vpc plan
