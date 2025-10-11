variable "cluster_name" {
  description = "Name for the EKS cluster"
  type        = string
  default     = "Microservices"
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "kubernetes_version" {
  description = "Kubernetes version for EKS cluster"
  type        = string
  default     = "1.28"
}

variable "vpc_cidr" {
  description = "VPC CIDR block for the EKS cluster"
  type        = string
}

variable "node_group" {
  description = "Node group instance type"
  type        = string
  default     = "t3.medium"
}

variable "node_group_desired_size" {
  description = "The number of desired worker nodes."
  type        = number
  default     = 1
}

variable "node_group_min_size" {
  description = "The minimum number of worker nodes."
  type        = number
  default     = 1
}

variable "node_group_max_size" {
  description = "The maximum number of worker nodes."
  type        = number
  default     = 1
}

variable "tags" {
  description = "Default tags for project"
  type        = map(string)
  default = {
    Project_Name = "video-converter"
    Environment  = "dev"
  }
}
