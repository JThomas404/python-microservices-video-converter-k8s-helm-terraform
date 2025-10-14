# Python Microservices Video Converter - K8s + Helm + Terraform

End-to-end Python microservices application that converts MP4 videos to MP3 audio, deployed on AWS EKS using Kubernetes, Helm, and Terraform for fully automated, infrastructure-as-code provisioning.

## Project Status: In Progress

This project is currently under active development as a learning exercise for Kubernetes, Helm, and Terraform integration.

## Project Overview

### Architecture
- **Infrastructure**: AWS EKS cluster with managed node groups
- **Container Orchestration**: Kubernetes
- **Package Management**: Helm charts for data services
- **Infrastructure as Code**: Terraform modules
- **Data Services**: MongoDB, PostgreSQL
- **Microservices**: Auth, Gateway, Video Converter (planned)

### Current Implementation
```
terraform/
├── modules/
│   ├── eks-cluster/          # EKS cluster, VPC, IAM roles
│   └── helm-datastore/       # MongoDB, PostgreSQL via Helm
└── envs/
    └── dev/                  # Development environment
```

## Completed Components

### 1. EKS Cluster Module
- VPC with public/private subnets across 2 AZs
- Internet Gateway and route tables
- EKS cluster with managed node group
- IAM roles and policies for EKS and worker nodes
- Security groups for cluster communication

### 2. Data Services Module
- MongoDB deployment via Helm (Bitnami chart)
- PostgreSQL deployment via Helm (Bitnami chart)
- NodePort services for external access
- Disabled persistence for learning environment

### 3. Infrastructure Outputs
- EKS cluster endpoint and name
- Database connection strings
- Service NodePorts for external access

## Issues Encountered & Solutions

### Issue 1: Bitnami Chart Repository Migration
**Problem**: Charts failed to deploy with "invalid_reference: invalid tag" errors

**Root Cause**: Bitnami migrated from HTTP-based repository (`https://charts.bitnami.com/bitnami`) to OCI-based repository (`oci://registry-1.docker.io/bitnamicharts`)

**Solution**:
```bash
# Updated repository URLs in Terraform
repository = "oci://registry-1.docker.io/bitnamicharts"
```

**Troubleshooting Commands**:
```bash
# Check chart availability
helm search repo bitnami/mongodb --versions

# Test repository access
curl -s "https://repo.broadcom.com/bitnami-files/index.yaml" | grep mongodb

# Verify OCI repository
helm show chart oci://registry-1.docker.io/bitnamicharts/mongodb --version 18.0.7
```

### Issue 2: RabbitMQ Image Availability
**Problem**: RabbitMQ pods stuck in `ImagePullBackOff` state

**Root Cause**: Bitnami RabbitMQ images moved to commercial subscription model

**Solution**: Removed RabbitMQ from initial deployment to focus on core Kubernetes learning

**Troubleshooting Commands**:
```bash
# Check pod status
kubectl get pods
kubectl describe pod rabbitmq-0

# Check Helm releases
helm list
helm status rabbitmq

# Clean up failed deployments
helm uninstall rabbitmq
```

### Issue 3: Terraform State Lock Issues
**Problem**: "Error acquiring the state lock" preventing deployments

**Root Cause**: Stuck Terraform processes from failed deployments

**Solution**:
```bash
# Find stuck processes
ps aux | grep terraform

# Kill stuck processes
kill <process_id>

# Use lock bypass for recovery
terraform apply -lock=false
```

### Issue 4: Incomplete Resource Cleanup
**Problem**: Terraform validation errors due to orphaned resource references

**Solution**:
```bash
# Check Terraform state
terraform state list

# Remove orphaned resources
terraform state rm module.helm_datastore.helm_release.rabbitmq

# Validate configuration
terraform validate
```

## Current Deployment

### Infrastructure Status
- EKS Cluster: `my-cluster` (running)
- MongoDB: Deployed and accessible via NodePort 30005
- PostgreSQL: Deployed and accessible via NodePort 30003
- Terraform State: Clean and validated

### Access Information
```bash
# Cluster endpoint
https://003997890006DF46DBF0A0FF71C6166E.gr7.us-east-1.eks.amazonaws.com

# Database connections
mongodb://mongodb:27017
postgresql://postgresql@postgresql-postgresql:5432
```

## Key Learning Outcomes

1. **Helm Repository Evolution**: Understanding migration from HTTP to OCI repositories
2. **Terraform State Management**: Handling locks and resource cleanup
3. **Kubernetes Troubleshooting**: Using kubectl for pod diagnostics
4. **Infrastructure Modularity**: Separating EKS and application concerns
5. **Commercial vs Open Source**: Navigating licensing changes in container ecosystems

## Next Steps

1. **K8s Application Module**: Deploy placeholder microservices
2. **Python Microservices**: Build auth, gateway, and converter services
3. **CI/CD Pipeline**: Automate deployments
4. **Monitoring**: Add observability stack
5. **Security**: Implement RBAC and network policies

## Development Commands

```bash
# Deploy infrastructure
cd terraform/envs/dev
terraform init
terraform plan
terraform apply

# Check deployment status
kubectl get pods
kubectl get services
helm list

# Cleanup
terraform destroy
```
