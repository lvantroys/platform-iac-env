variable "name" { type = string }
variable "vpc_id" { type = string }

variable "retention_days" { 
    type = number
    default = 90 
    }
variable "kms_key_arn" { 
    type = string
    default = null 
    }
variable "traffic_type" {
     type = string
     default = "ALL"
      }

variable "tags" { 
    type = map(string)
     default = {} 
     }
