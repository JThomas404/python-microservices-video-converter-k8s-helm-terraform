module "eks_cluster" {
  source = "../../modules/eks-cluster"

  cluster_name       = "my-cluster"
  vpc_cidr           = "10.0.0.0/16"
  availability_zones = ["us-east-1a", "us-east-1b"]
}

module "helm_datastore" {
  source = "../../modules/helm-datastore"

  mongodb_root_password    = var.mongodb_password
  postgresql_root_password = var.postgresql_password
}
