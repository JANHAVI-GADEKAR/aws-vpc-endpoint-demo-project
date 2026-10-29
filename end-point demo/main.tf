
# ==========================================
# AWS Provider Configuration
# ==========================================

provider "aws" {
  region = var.aws_region
}

# ==========================================
# Create S3 Gateway VPC Endpoint
# ==========================================

resource "aws_vpc_endpoint" "s3_endpoint" {

  # VPC ID from Network Remote State
  vpc_id = data.terraform_remote_state.network.outputs.vpc_id

  # AWS S3 Service
  service_name = "com.amazonaws.${var.aws_region}.s3"

  # Gateway Endpoint Type
  vpc_endpoint_type = "Gateway"

  # Associate with Private Route Table
  route_table_ids = [
    data.terraform_remote_state.network.outputs.private_route_table_id
  ]

  # Resource Tags
  tags = {
    Name        = "${var.project_name}-s3-gateway-endpoint"
    Environment = "Demo"
    Project     = var.project_name
  }
}

