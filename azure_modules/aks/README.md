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


## Networking Configuration
This module configures the AKS cluster using Azure CNI with the following networking settings:
- Network Plugin: Azure CNI with Calico network policy.
- Subnet Requirement: The AKS cluster requires a pre-existing subnet that is not provisioned within the virtual network itself. The subnet must be created independently and passed as vnet_subnet_id in the module.
- Service CIDR: The service_cidr defines the range of virtual IP addresses for Kubernetes services.
- DNS Service IP: The dns_service_ip is used for DNS resolution within the cluster.

## Entra ID Integration (Azure AD)
This module enables Azure Role-Based Access Control (RBAC) using Entra ID (formerly Azure AD) for secure cluster access management.

Key Configurations:
•	Admin Group Object IDs: The aks_admin_group variable should be populated with the Object IDs of the Azure AD security groups allowed to manage the cluster.
•	Azure RBAC: Azure-native RBAC (azure_rbac_enabled) is enabled for fine-grained access control.
•	Local Accounts Disabled: Local Kubernetes accounts are disabled (local_account_disabled = true) for enhanced security.

Example Entra ID Security Group Setup:
1.	Create an Entra ID security group.
2.	Add the Object ID of the group to the aks_admin_group variable.
3.	Ensure users who need cluster access are added to this group.

## Service Mesh Integration

The AKS cluster is configured with Istio Service Mesh:
- Mode: Istio is enabled for secure microservices communication.
- Version: The asm-1-23 revision is deployed.
- Traffic Management: Manages service-to-service traffic and enforces security policies.

## Monitoring & Logging
The module configures Azure Monitor through a Log Analytics Workspace:
- Metrics and Logs: Captures all metrics and diagnostic logs (AllMetrics, allLogs).
- Diagnostic Settings: Configures an azurerm_monitor_diagnostic_setting for comprehensive observability

## Inputs
Variable Name | Type | Description                                         | Required | Default Value
--- | --- |-----------------------------------------------------|----------| ---
`aks_name`| string| The name of the AKS cluster.                        | Yes      | N/A
`resource_group_name` | string | Name of the existing resource group.                | Yes      | N/A
`location` | string | Azure region for resource deployment.               | Yes      | N/A
`vm_size` | string | The size of the VMs in the node pool.               | Yes      | Standard_DS2_v2
`node_count` | number | The number of nodes in the node pool.               | Yes      | 3
`aks_admin_group` | list(string) | List of Entra ID group object IDs for cluster admin. | Yes      | N/A
`private_dns_zone_id` | string | Resource ID of the private DNS zone, e.g., /subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-aks/providers/Microsoft.Network/privateDnsZones/privatelink.westus2.azmk8s.io.                   | Yes      | N/A
`service_cidr` | string | CIDR block for the Kubernetes services | Yes      | N/A
`dns_service_ip` | string | IP address for DNS resolution within the cluster | Yes      | N/A
`tags` | map(string) | Tags to apply to all resources | Yes      | N/A
`log_analytics_workspace_name` | string | Name of the Log Analytics workspace for monitoring and logging. | Yes      | N/A
`log_analytics_workspace_resource_group` | string | ame of the resource group where the Log Analytics workspace is located. | Yes      | N/A
