output "vpc_id" { value = aws_vpc.this.id }
output "vpc_cidr" { value = aws_vpc.this.cidr_block }
output "igw_id" { value = aws_internet_gateway.this.id }

output "public_subnet_ids" { value = [for s in aws_subnet.public : s.id] }
output "private_subnet_ids" { value = [for s in aws_subnet.private : s.id] }

output "public_route_table_id" { value = aws_route_table.public.id }
output "private_route_table_ids" { value = { for az, rt in aws_route_table.private : az => rt.id } }

output "nat_gateway_ids" { value = { for az, ngw in aws_nat_gateway.this : az => ngw.id } }
