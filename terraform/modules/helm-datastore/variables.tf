variable "namespace" {
  description = "Kubernetes namespace for data services"
  type        = string
  default     = "default"
}

# MongoDB

variable "mongodb_chart_version" {
  description = "Version of MongoDB Helm Chart"
  type        = string
  default     = "18.0.7"
}

variable "mongodb_nodeport" {
  description = "NodePort for MongoDB service"
  type        = number
  default     = 30005
}

variable "mongodb_storage_size" {
  description = "Storage for MongoDB database"
  type        = string
  default     = "8Gi"
}

variable "mongodb_root_password" {
  description = "Root password for MongoDB database"
  type        = string
  sensitive   = true
}

# PostgreSQL

variable "postgresql_chart_version" {
  description = "Version of PostgreSQL Helm Chart"
  type        = string
  default     = "18.0.14"
}

variable "postgresql_nodeport" {
  description = "NodePort for PostgreSQL service"
  type        = number
  default     = 30003
}

variable "postgresql_storage_size" {
  description = "Storage for PostgreSQL database"
  type        = string
  default     = "8Gi"
}

variable "postgresql_root_password" {
  description = "Root password for PostgreSQL database"
  type        = string
  sensitive   = true
}


