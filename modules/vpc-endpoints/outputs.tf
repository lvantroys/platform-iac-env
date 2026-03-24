output "endpoint_sg_id" { value = aws_security_group.endpoints.id }

output "gateway_endpoints" {
  value = {
    s3       = try(aws_vpc_endpoint.s3[0].id, null)
    dynamodb = try(aws_vpc_endpoint.dynamodb[0].id, null)
  }
}

output "interface_endpoints" { value = { for k, ep in aws_vpc_endpoint.if : k => ep.id } }
