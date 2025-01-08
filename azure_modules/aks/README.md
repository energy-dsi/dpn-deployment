# AKS Module

## About

### Purpose
This Terraform module deploys an Azure Kubernetes Service (AKS) cluster in an existing Azure Resource Group with best practices for security, networking, and monitoring. 
The cluster is integrated with Azure Monitor through a Log Analytics Workspace and supports Entra ID (formerly Azure AD) for role-based access control (RBAC).

## Key Features
- **AKS Cluster Creation:** Deploys a secure, scalable AKS cluster.
- **Networking:** Configurable Azure CNI networking with Calico network policy and support for private clusters.
- **Entra ID Integration:** Enforces Azure role-based access control using Entra ID security groups.
- **Node Pool Management:** Single default node pool with configurable scaling, VM size, and zone redundancy.
- **Service Mesh:** Enables Istio-based service mesh for traffic management and security.
- **Monitoring & Logging:** Integrated with Azure Monitor via Log Analytics Workspace and diagnostic settings.

## Module Outputs
- All outputs are detailed in the [outputs.tf](./outputs.tf) file.

## Requirements
- Terraform v0.12.x
- Azure Provider `>=4.8.0`
- Azure CLI, required for initial authentication

## Resources Created
- Log Analytics Workspace Integration: Cluster logs and metrics are sent to a Log Analytics workspace.
- Azure Kubernetes Cluster: Configured with a default node pool and secure configurations.
- Entra ID (Azure AD) Integration: Configures Entra ID for secure access.
- Service Mesh (Istio): Enabled with the latest revision for secure microservices communication.
- Azure Monitor Diagnostic Settings: Captures metrics and logs for observability.


