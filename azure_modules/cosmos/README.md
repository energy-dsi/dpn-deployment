# Cosmos DB

### About

### Purpose
This Terraform module deploys an Azure Cosmos DB account in an existing Azure Resource Group with best practices for security, networking, and monitoring. 
The account is integrated with Azure Monitor through a Log Analytics Workspace.
The module also creates a Cosmos MongoDB API database.

### Key Features
- **Cosmos DB Deployment**: Creates an Azure Cosmos DB account with a specified API and strong consistency.
- **Diagnostic Settings**: Configures Azure Monitor Diagnostic Settings to capture all logs and metrics, forwarding them to a designated Log Analytics Workspace.
- **Tagging**: Supports custom tags for resource management and organisation.
- **MongoDB Database**: Creates a MongoDB API database within the Cosmos DB account.
- **Private Endpoint**: Creates a private endpoint for the Cosmos DB account.
- **Geo-Redundancy**: Configures geo-redundancy for the Cosmos DB account.

## Module Outputs
- All outputs are detailed in the [outputs.tf](outputs.tf) file.

## Requirements
- Terraform v0.12.x
- Azure Provider `>=4.8.0`
- Azure CLI, required for initial authentication

## Resources Created
- Log Analytics Workspace Integration: Cosmos DB logs and metrics are sent to a Log Analytics workspace.
- Azure Cosmos DB Account: Configured with a MongoDB API and diagnostic settings.
- Private Endpoint: Private endpoint for the Cosmos DB account.
- MongoDB Database: A MongoDB API database within the Cosmos DB account.

## Inputs
| Variable Name                       | Type        | Description                                                              | Required | Default    |
|-------------------------------------|-------------|--------------------------------------------------------------------------|----------|------------|
| `location`                          | string      | Azure region for resource deployment.                                    | Yes      | `UK South` |
| `name`                              | string      | The name of the Azure Cosmos DB account.                                 | Yes      | N/A        |
| `resource_group_name`               | string      | Name of the existing resource group.                                     | Yes      | N/A        |
| `tags`                              | map(string) | A map of tags to assign to the Azure Cosmos DB account.                  | No       | `{}`       |
| `failover_location`                 | string      | The region to use as the failover location.                              | Yes      | UKWest     |
| `vnet_subnet_name`                  | string      | The name of the subnet in which the CosmosDB account will be created.    | Yes      | N/A        |
| `vnet_resource_group_name`          | string      | The name of the virtual network in which the subnet is located           | Yes      | N/A        |
| `log_analytics_workspace_name`      | string      | The name of the existing Log Analytics Workspace for diagnostics.        | Yes      | N/A        |
| `log_analytics_resource_group_name` | string      | The name of the existing resource group for the Log Analytics Workspace. | Yes      | N/A        |
| `cosmos_private_dns_zone_id`        | string      | The ID of the private DNS zone for the Cosmos DB account.                | Yes      | N/A        |
