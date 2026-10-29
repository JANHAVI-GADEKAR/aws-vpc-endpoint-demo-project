
provider "aws" {
  region = "ap-south-1"
}

# 1. Create VPC
resource "aws_vpc" "endpoint_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "vpc-endpoint-demo"
  }
}

# 2. Public Subnet
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.endpoint_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "endpoint-public-subnet"
  }
}

# 3. Private Subnet
resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.endpoint_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "ap-south-1a"

  tags = {
    Name = "endpoint-private-subnet"
  }
}

# 4. Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.endpoint_vpc.id

  tags = {
    Name = "endpoint-igw"
  }
}

# 5. Public Route Table
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.endpoint_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "endpoint-public-rt"
  }
}

# 6. Private Route Table
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.endpoint_vpc.id

  tags = {
    Name = "endpoint-private-rt"
  }
}

# 7. Public Route Table Association
resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public_rt.id
}

# 8. Private Route Table Association
resource "aws_route_table_association" "private_assoc" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private_rt.id
}
