variable "name" { type = string }
variable "vpc_id" { type = string }
variable "vpc_cidr" { type = string }
variable "private_subnet_ids" { type = list(string) }
variable "private_route_table_ids" {
  type        = list(string)
  description = "Route table IDs for private subnets (for gateway endpoints)."
}
variable "aws_region" { type = string }

variable "enable_s3_gateway_endpoint" { 
  type = bool
  default = true
  }
variable "enable_dynamodb_gateway_endpoint" { 
  type = bool
  default = true 
  }

variable "interface_endpoints" {
  type = map(object({
    service             = string
    private_dns_enabled = optional(bool, true)
  }))
  default     = {}
  description = "Optional override for interface endpoints. If empty, module uses a sensible default set."
}

variable "tags" {
  type    = map(string)
  default = {}
}
