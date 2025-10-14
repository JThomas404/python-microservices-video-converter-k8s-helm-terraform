output "mongodb_service_name" {
  description = "MongoDB service name for internal connections"
  value       = helm_release.mongodb.name
}

output "mongodb_connection_string" {
  description = "MongoDB connection string for applications"
  value       = "mongodb://${helm_release.mongodb.name}:27017"
}

output "postgresql_connection_host" {
  description = "PostgreSQL service hostname"
  value       = "${helm_release.postgresql.name}-postgresql"
}

output "postgresql_connection_string" {
  description = "PostgreSQL connection string for applications"
  value       = "postgresql://postgresql@${helm_release.postgresql.name}-postgresql:5432"
}

output "service_ports" {
  description = "NodePorts for external access to services"
  value = {
    mongodb    = var.mongodb_nodeport
    postgresql = var.postgresql_nodeport
  }
}
