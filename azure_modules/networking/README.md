# Virtual Network

## About

### Purpose
This Terraform module deploys an Azure Virtual Network in an existing Azure Resource Group. It also deploys a subnet with the specified address prefix for Event Hub, AKS, and Cosmos DB. 
Additionally, the module deploys a Private DNS Zone for AKS, Event Hub, and Cosmos DB.

## Key Features
- **Virtual Network Creation:** Deploys a Virtual Network with a subnet for Event Hub, AKS, and Cosmos DB.
- **Subnet Creation:** Deploys a subnet with the specified address prefix for Event Hub, AKS, and Cosmos DB.
- **Private DNS Zone Creation:** Deploys a Private DNS Zone for AKS, Event Hub, and Cosmos DB.
- **Tags:** Tags are applied to the Virtual Network and Private DNS Zone.

## Requirements
- Terraform v0.12.x
- Azure Provider `>=4.8.0`
- Azure CLI, required for initial authentication

## Resources Created
- Virtual Network: Configured with a subnet for Event Hub, AKS, and Cosmos DB.
- Subnet: Configured with the specified address prefix for Event Hub, AKS, and Cosmos DB.
- Private DNS Zone: Configured for AKS, Event Hub, and Cosmos DB.

## Inputs
| Variable Name                            | Type         | Description                                                                                                                                                                                     | Required | Default |
|------------------------------------------|--------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|---------|
| `vnet_name`                              | string       | The name of the Virtual Network.                                                                                                                                                                | Yes      | N/A     |
| `location`                               | string       | The Azure region where the Virtual Network will be deployed.                                                                                                                                    | Yes      | N/A     |
| `vnet_resource_group_name`               | string       | The name of the existing resource group where the Virtual Network will be deployed.                                                                                                             | Yes      | N/A     |
| `tags`                                   | map(string)  | Tags to apply to the Virtual Network and Private DNS Zone.                                                                                                                                      | Yes      | N/A     |

