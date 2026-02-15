module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.1.0"

  name = "spotify-vpc"
  cidr = "10.0.0.0/16"

  azs = ["ap-south-1a", "ap-south-1b"]

  public_subnets = [
    "10.0.101.0/24",
    "10.0.102.0/24"
  ]

  enable_nat_gateway = false
  enable_dns_hostnames = true

  # 🔥 THIS FIX IS IMPORTANT
  map_public_ip_on_launch = true
}
