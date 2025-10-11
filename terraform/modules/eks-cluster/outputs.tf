output "cluster_endpoint" {
  description = "EKS cluster endpoint"
  value       = aws_eks_cluster.eks-cluster.endpoint
}

output "cluster_ca_certificate" {
  description = "EKS cluster CA cert"
  value       = aws_eks_cluster.eks-cluster.certificate_authority[0].data
  sensitive   = true
}

output "cluster_name" {
  description = "EKS cluster name"
  value       = aws_eks_cluster.eks-cluster.name
}

output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.eks-cluster-vpc.id
}

output "private_subnet_ids" {
  description = "Private subnet IDs"
  value       = values(aws_subnet.private)[*].id
}

output "public_subnet_ids" {
  description = "Public subnet IDs"
  value       = values(aws_subnet.public)[*].id
}

output "node_group_arn" {
  description = "Node group ARN"
  value       = aws_eks_node_group.eks-node-group.arn
}
