provider "aws" {
  region = var.region

  default_tags {
    tags = var.tags
  }
}

provider "kubernetes" {
  host                   = "placeholder"
  cluster_ca_certificate = "placeholder"
  token                  = "placeholder"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}
