# Storage Account

## About

### Purpose
This Terraform module provisions an Azure Storage Account within an existing Azure Resource Group, complete with diagnostic settings enabled. The primary purpose of this storage account is to store data ingested as part of the DPN Data Engineering pipeline.

### Key Features
- **Storage Account Deployment**: Creates an Azure Storage Account with the specified configuration.
- **Diagnostic Settings**: Configures Azure Monitor Diagnostic Settings to **Blob Services** all `StorageRead`, `StorageWrite`, and `StorageDelete` logs and metrics, forwarding them to a designated Log Analytics Workspace.
- **Tagging**: Supports custom tags for resource management and organisation.
- **Access**: Public network access can be disabled for improved security.

## Requirements
- Terraform v0.12.x
- Azure Provider `>=4.8.0`
- Azure CLI, required for initial authentication

## Resources Created
- Log Analytics Workspace Integration: Storage Account logs and metrics are sent to a Log Analytics workspace.
- Storage V2 Account: Configured with the specified settings.
- Diagnostic Settings: Azure Monitor Diagnostic Settings for Blob Services.

## Inputs
| **Variable Name**                   | **Type**      | **Description**                                                                 | **Required** | **Default** |
|-------------------------------------|---------------|---------------------------------------------------------------------------------|--------------|-------------|
| `storage_account_name`              | `string`      | The name of the storage account.                                                | Yes          | N/A         |
| `storage_resource_group_name`       | `string`      | The name of the resource group where the storage account will be created.       | Yes          | N/A         |
| `location`                          | `string`      | The location of the storage account.                                            | No           | `"UKSouth"` |
| `account_tier`                      | `string`      | The storage account tier.                                                       | Yes          | N/A         |
| `account_replication_type`          | `string`      | The storage account replication type.                                           | Yes          | N/A         |
| `public_network_access_enabled`     | `bool`        | Whether or not public network access is enabled for the storage account.        | No           | `false`     |
| `tags`                              | `map(string)` | A map of tags to add to the storage account.                                    | No           | N/A         |
| `log_analytics_workspace_name`      | `string`      | The name of the Log Analytics workspace to use for diagnostics.                 | Yes          | N/A         |
| `log_analytics_resource_group_name` | `string`      | The name of the resource group in which the Log Analytics workspace is located. | Yes          | N/A         |
