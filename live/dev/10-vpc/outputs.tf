output "vpc_id" { value = module.vpc.vpc_id }
output "vpc_cidr" { value = module.vpc.vpc_cidr }
output "public_subnet_ids" { value = module.vpc.public_subnet_ids }
output "private_subnet_ids" { value = module.vpc.private_subnet_ids }
output "public_route_table_id" { value = module.vpc.public_route_table_id }
output "private_route_table_ids" { value = values(module.vpc.private_route_table_ids) }
output "nat_gateway_ids" { value = module.vpc.nat_gateway_ids }
output "igw_id" { value = module.vpc.igw_id }
