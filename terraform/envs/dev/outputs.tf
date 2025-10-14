# EKS Cluster Info
output "cluster_name" {
  description = "EKS cluster name"
  value       = module.eks_cluster.cluster_name
}

output "cluster_endpoint" {
  description = "EKS cluster endpoint"
  value       = module.eks_cluster.cluster_endpoint
}

# Database Connection Info
output "mongodb_connection" {
  description = "MongoDB connection string"
  value       = module.helm_datastore.mongodb_connection_string
}

output "postgresql_connection" {
  description = "PostgreSQL connection string"
  value       = module.helm_datastore.postgresql_connection_string
}

output "service_nodeports" {
  description = "External access ports"
  value       = module.helm_datastore.service_ports
}
