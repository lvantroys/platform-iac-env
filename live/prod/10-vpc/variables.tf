variable "aws_region" { type = string }
variable "environment" { type = string }
variable "app" { type = string }
variable "owner" { type = string }
variable "data_classification" { type = string }
variable "extra_tags" { 
    type = map(string)
    default = {} 
    }

variable "name_prefix" { type = string }
variable "vpc_cidr" { type = string }
variable "public_subnet_cidrs" { type = list(string) }
variable "private_subnet_cidrs" { type = list(string) }
variable "enable_nat_gateway" { 
    type = bool
    default = true
    }
