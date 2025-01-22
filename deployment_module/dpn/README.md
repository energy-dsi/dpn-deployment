# Infrastructure as Code (IaC) for Azure Resources

This repository defines the infrastructure as code (IaC) for provisioning a set of Azure resources using Terraform. The code leverages reusable modules and additional custom resources to ensure a comprehensive and standardised Azure infrastructure deployment.

## Overview

The Terraform configuration is designed to deploy a set of Azure resources required for a modern cloud-native application. It includes Azure Kubernetes Service (AKS), Azure Cosmos DB, Azure Event Hubs, and Azure Container Registry (ACR), along with their necessary networking and role-based access control (RBAC) configurations.

## Resources Provisioned

### Resource Group
A dedicated resource group is created to house the entire infrastructure:
```hcl
resource "azurerm_resource_group" "ia_resource_group"
```

### Private DNS Zones
Private DNS zones are defined and referenced for:
- AKS Cluster (`aks_dns_zone`)
- Cosmos DB (`cosmos_dns_zone`)
- Event Hubs (`eventhub_dns_zone`)

These ensure proper private connectivity for the respective services.

---

## Modules Invoked

### Azure Cosmos DB
The Cosmos DB instance is created using a module named `ia_cosmos`. Key parameters include:
- Private DNS Zone association
- Virtual Network integration
- Log Analytics workspace configuration

```hcl
module "ia_cosmos"
```
### Azure Event Hub
The Event Hub namespace is deployed using the `ia_eventhub` module. Key configurations include:
- Private DNS Zone association
- Virtual Network integration
- Log Analytics workspace configuration

```hcl
module "ia_eventhub"
```

### Azure Container Registry (ACR)
The Azure Container Registry is provisioned using the `ia_acr` module. This resource allows container images to be stored securely for deployment into the AKS cluster.

```hcl
module "ia_acr"
```
### Azure Storage Account
The Azure Storage Account is created using the `ia_storage_account module`. The storage account is used for storing data types required for data transformation as part of the IA.
```hcl
module "ia_storage_account"
```

### Azure Kubernetes Service (AKS)
The AKS cluster is deployed using the `ia_aks` module. It includes:
- Integration with a private DNS zone
- Network configuration with a specified virtual network and subnet
- Role-based access control (RBAC) for cluster administration
- Log Analytics integration for monitoring and observability
```hcl
module "ia_aks"
```

---
## Custom Resources and Role Assignments

### Azure Role Assignments
Two role assignments are explicitly defined to manage access control:

- **ACR Pull Role**: Grants the AKS kubelet identity permission to pull container images from the ACR:
  ```hcl
  resource "azurerm_role_assignment" "acr_pull_role"
  ```

- **AKS RBAC Cluster Admin**: Assigns the specified principal the Cluster Admin role on the entire subscription scope:
  ```hcl
  resource "azurerm_role_assignment" "aks_role_assignment"
  ```

### Kafka Topic Creation in Event Hub
Several Event Hub topics (event hubs) are created within the Event Hub namespace for message streaming and Kafka-style topic management:
- `knowledge`
- `ontology`
- `federated-knowledge-filtered`
- `federated-knowledge-filtered-dlq`

These topics allow for partitioned message handling and event-based communication between services.

```hcl
resource "azurerm_eventhub" "knowledge"
resource "azurerm_eventhub" "ontology"
resource "azurerm_eventhub" "federated-knowledge-filtered"
resource "azurerm_eventhub" "federated-knowledge-filtered-dlq"
```

---
## Variables Used
The codebase uses a range of variables to promote reusability and flexibility. Key variables include:

- **`location`**: Azure region for deployment
- **`vnet_name`**: Virtual network name
- **`vnet_subnet_name`**: Subnet names for various services
- **`tags`**: Custom tags for resource labelling
- **`node_count` and `vm_size`**: AKS cluster node configurations
- **`service_cidr` and `dns_service_ip`**: Network settings for AKS
- **Private DNS Zones** for secure internal resolution:
    - `aks_private_dns_name`
    - `cosmosdb_private_dns_zone_name`
    - `eventhub_private_dns_zone_name`

---


