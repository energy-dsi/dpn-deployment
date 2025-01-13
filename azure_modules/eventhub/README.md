# Event Hub

## About

### Purpose
This Terraform module deploys an Azure Event Hub in an existing Azure Resource Group with best practices for security, networking, and monitoring.

The Event Hub is integrated with Azure Monitor through a Log Analytics Workspace.

The Event Hub acts as Kafka for Azure, providing a distributed streaming platform with low latency and high throughput.

## Key Features
- **Event Hub Deployment**: Creates an Azure Event Hub with a `Standard` SKU.
- **Diagnostic Settings**: Configures Azure Monitor Diagnostic Settings to capture all logs and metrics, forwarding them to a designated Log Analytics Workspace.
- **Tagging**: Supports custom tags for resource management and organisation.
- **Private Endpoint**: Creates a private endpoint for the Event Hub.

## Module Outputs
- All outputs are detailed in the [outputs.tf](outputs.tf) file.

## Requirements
- Terraform v0.12.x
- Azure Provider `>=4.8.0`
- Azure CLI, required for initial authentication

## Resources Created

- Log Analytics Workspace Integration: Event Hub logs and metrics are sent to a Log Analytics workspace.
- Azure Event Hub: Configured with a `Standard` SKU and diagnostic settings.
- Private Endpoint: Private endpoint for the Event Hub.

## Inputs
| Variable Name                       | Type        | Description                                                              | Required | Default    |
|-------------------------------------|-------------|--------------------------------------------------------------------------|----------|------------|
| `location`                          | string      | Azure region for resource deployment.                                    | Yes      | `UK South` |
| `name`                              | string      | The name of the Azure Event Hub.                                         | Yes      | N/A        |
| `resource_group_name`               | string      | Name of the existing resource group.                                     | Yes      | N/A        |
| `tags`                              | map(string) | A map of tags to assign to the Azure Event Hub.                          | No       | `{}`       |
| `vnet_subnnet_name`                 | string      | The name of the subnet in which the Event Hub will be created.           | Yes      | N/A        |
| `vnet_resource_group_name`          | string      | The name of the virtual network in which the subnet is located.          | Yes      | N/A        |
| `vnet_name`                         | string      | The name of the virtual network in which the subnet is located.          | Yes      | N/A        |
| `log_analytics_workspace_name`      | string      | The name of the existing Log Analytics Workspace for diagnostics.        | Yes      | N/A        |
| `log_analytics_resource_group_name` | string      | The name of the existing resource group for the Log Analytics Workspace. | Yes      | N/A        |
| `event_hub_private_dns_zone_id`     | string      | The ID of the private DNS zone for the Event Hub.                        | Yes      | N/A        |

