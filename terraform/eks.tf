module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.8.3"

  cluster_name    = var.cluster_name
  cluster_version = "1.29"

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.public_subnets   # 🔥 Use public subnets

  cluster_endpoint_public_access  = true
  cluster_endpoint_private_access = false

  enable_cluster_creator_admin_permissions = true

  eks_managed_node_groups = {
    default = {
      instance_types = [var.node_instance_type]

      min_size     = 2
      max_size     = 3
      desired_size = 2

      capacity_type = "ON_DEMAND"
    }
  }
}
