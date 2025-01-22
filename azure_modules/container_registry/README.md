# Container Registry (ACR)

## About

### Purpose
This Terraform module deploys an Azure Container Registry (ACR) in an existing Azure Resource Group
with best practices for security, networking, and monitoring.
The registry is integrated with Azure Monitor through a Log Analytics Workspace.

## Key Features
**ACR Deployment**: Creates an Azure Container Registry with a specified SKU.
**Diagnostic Settings**: Configures Azure Monitor Diagnostic Settings to capture all logs and metrics, forwarding them to a designated Log Analytics Workspace.
**Tagging**: Supports custom tags for resource management and organisation.

## Module Outputs
- All outputs are detailed in the [outputs.tf](outputs.tf) file.

## Requirements
- Terraform v0.12.x
- Azure Provider `>=4.8.0`
- Azure CLI, required for initial authentication

## Resources Created
- Log Analytics Workspace Integration: Registry logs and metrics are sent to a Log Analytics workspace.
- Azure Container Registry: Configured with a `Standard` SKU and diagnostic settings.
- Admin User: Admin user `false` by default.

## Inputs
| Variable Name                       | Type        | Description                                                              | Required | Default    |
|-------------------------------------|-------------|--------------------------------------------------------------------------|----------|------------|
| `acr_name`                          | string      | The name of the Azure Container Registry.                                | Yes      | N/A        |
| `resource_group_name`               | string      | Name of the existing resource group.                                     | Yes      | N/A        |
| `location`                          | string      | Azure region for resource deployment.                                    | Yes      | `UK South` |
| `log_analytics_workspace_name`      | string      | The name of the existing Log Analytics Workspace for diagnostics.        | Yes      | N/A        |
| `log_analytics_resource_group_name` | string      | The name of the existing resource group for the Log Analytics Workspace. | Yes      | N/A        |
| `tags`                              | map(string) | A map of tags to assign to the Azure Container Registry.                 | No       | `{}`       |
