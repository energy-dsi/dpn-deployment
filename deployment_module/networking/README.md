
# Terraform Configuration for Azure Virtual Network and Log Analytics Workspace

This repository contains a Terraform configuration to deploy an Azure Virtual Network and a Log Analytics Workspace. The resources are organised using reusable modules and standardised resource definitions for easy and consistent infrastructure deployment.

---

## Overview

The Terraform code provisions the following Azure resources:
- **Resource Groups**: Separate resource groups for the virtual network and log analytics workspace.
- **Virtual Network (VNet)**: Deployed using a reusable module.
- **Log Analytics Workspace**: Created using a reusable module for observability and monitoring.

---

## Resources Provisioned

### Resource Groups
Two resource groups are created to organise the resources:
- **Virtual Network Resource Group**
- **Log Analytics Resource Group**

```hcl
resource "azurerm_resource_group" "virtual_network_resource_group"
resource "azurerm_resource_group" "log_analytics_resource_group"
```

### Virtual Network (VNet)
A virtual network is deployed using the `virtual_network` module. Key configurations include:
- Custom virtual network name
- Configured within its dedicated resource group

```hcl
module "virtual_network"
```

### Log Analytics Workspace
A log analytics workspace is deployed using the `log_analytics` module. It is configured with:
- A custom workspace name
- Deployed within its own resource group
- Tagging for resource management and cost tracking

```hcl
module "log_analytics"
```

---

## Variables
The Terraform code uses the following variables for flexibility and reusability:

- **`virtual_resource_group_name`**: Name of the resource group for the virtual network
- **`location`**: Azure region for deployment (default: `"uksouth"`)
- **`vnet_name`**: Name of the virtual network
- **`log_analytics_workspace_name`**: Name of the log analytics workspace
- **`log_analytics_resource_group_name`**: Name of the resource group for log analytics
- **`tags`**: Map of tags for resource management and cost tracking (default: `{}`)

---
