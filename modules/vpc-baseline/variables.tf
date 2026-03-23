variable "name" {
  type        = string
  description = "Name prefix for resources."
}

variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR block."
}

variable "azs" {
  type        = list(string)
  description = "List of AZs (must be 3 for this design)."
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "CIDRs for public subnets (one per AZ)."
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "CIDRs for private subnets (one per AZ)."
}

variable "enable_nat_gateway" {
  type        = bool
  default     = true
  description = "Create NAT gateways (one per AZ)."
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Extra tags."
}
