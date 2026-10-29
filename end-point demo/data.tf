
data "terraform_remote_state" "network" {
  backend = "s3"

  config = {
    bucket = "vpc-endpoint-demo"
    key    = "vpc-endpoints/network/terraform.tfstate"
    region = "ap-south-1"
  }
}
