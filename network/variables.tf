
variable "aws_region" {
  description = "AWS Region for VPC"
  type        = string
  default     = "ap-south-1"
}

variable "project_name" {
  description = "Project Name"
  type        = string
  default     = "vpc-endpoint-demo"
}

variable "vpc_cidr" {
  description = "CIDR Block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR for Public Subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR for Private Subnet"
  type        = string
  default     = "10.0.2.0/24"
}
