# MongoDB

resource "helm_release" "mongodb" {
  name       = "mongodb"
  repository = "oci://registry-1.docker.io/bitnamicharts"
  chart      = "mongodb"
  version    = "18.0.7"

  # Configure NodePort
  set {
    name  = "service.type"
    value = "NodePort"
  }

  set {
    name  = "service.nodePorts.mongodb"
    value = var.mongodb_nodeport
  }

  set {
    name  = "auth.rootPassword"
    value = var.mongodb_root_password
  }

  set {
    name  = "persistence.enabled"
    value = "false"
  }
}

# PostgreSQL

resource "helm_release" "postgresql" {
  name       = "postgresql"
  repository = "oci://registry-1.docker.io/bitnamicharts"
  chart      = "postgresql"
  version    = "18.0.14"

  # Configure NodePort
  set {
    name  = "service.type"
    value = "NodePort"
  }

  set {
    name  = "primary.service.nodePorts.postgresql"
    value = var.postgresql_nodeport
  }

  set {
    name  = "auth.postgresPassword"
    value = var.postgresql_root_password
  }

  set {
    name  = "primary.persistence.enabled"
    value = "false"
  }

}


