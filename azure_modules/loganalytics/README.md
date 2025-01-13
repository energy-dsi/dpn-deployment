# Log Analytics

## About

### Purpose
This Terraform module deploys an Azure Log Analytics Workspace in an existing Azure Resource Group with best practices for security, networking, and monitoring.

### Key Features
- **Log Analytics Workspace Creation:** Deploys a Log Analytics Workspace.
- ** Sku:** PerGB2018
- **Retention:** 730 days
- **Tags:** Tags are applied to the Log Analytics Workspace.

## Requirements
- Terraform v0.12.x
- Azure Provider `>=4.8.0`
- Azure CLI, required for initial authentication

## Resources Created
- Log Analytics Workspace: Configured with the PerGB2018 SKU and 730-day retention.

## Inputs
| Variable Name                            | Type         | Description                                                                                                                                                                                     | Required | Default |
|------------------------------------------|--------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|---------|
| `log_analytics_workspace_name`           | string       | The name of the Log Analytics Workspace.                                                                                                                                                        | Yes      | N/A     |
| `location`                               | string       | The Azure region where the Log Analytics Workspace will be deployed.                                                                                                                            | Yes      | N/A     |
| `log_analytics_resource_group_name`      | string       | The name of the existing resource group where the Log Analytics Workspace will be deployed.                                                                                                     | Yes      | N/A     |
| `tags`                                   | map(string)  | Tags to apply to the Log Analytics Workspace.                                                                                                                                                   | Yes      | N/A     |

