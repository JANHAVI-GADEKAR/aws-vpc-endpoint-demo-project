
# VPC ID
output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.endpoint_vpc.id
}

# Public Subnet ID
output "public_subnet_id" {
  description = "ID of the Public Subnet"
  value       = aws_subnet.public.id
}

# Private Subnet ID
output "private_subnet_id" {
  description = "ID of the Private Subnet"
  value       = aws_subnet.private.id
}

# Public Route Table ID
output "public_route_table_id" {
  description = "ID of the Public Route Table"
  value       = aws_route_table.public_rt.id
}

# Private Route Table ID
output "private_route_table_id" {
  description = "ID of the Private Route Table"
  value       = aws_route_table.private_rt.id
}

# Internet Gateway ID
output "internet_gateway_id" {
  description = "ID of the Internet Gateway"
  value       = aws_internet_gateway.igw.id
}
