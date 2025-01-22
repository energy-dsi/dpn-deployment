resource "azurerm_storage_account" "dpn_storage_account" {
  name                          = var.storage_account_name
  resource_group_name           = var.storage_resource_group_name
  location                      = var.location
  account_kind                  = "StorageV2"
  account_tier                  = var.account_tier
  account_replication_type      = var.account_replication_type
  public_network_access_enabled = var.public_network_access_enabled
  tags                          = var.tags
}

resource "azurerm_monitor_diagnostic_setting" "storage_account_diagnostic" {
  name                       = "${var.storage_account_name}-diagnostic"
  target_resource_id         = "${azurerm_storage_account.dpn_storage_account.id}/blobServices/default/"
  log_analytics_workspace_id = data.azurerm_log_analytics_workspace.log_analytics.id

  metric {
    category = "AllMetrics"
    enabled  = true
  }

  enabled_log {
    category = "StorageRead"
  }

  enabled_log {
    category = "StorageWrite"
  }

  enabled_log {
    category = "StorageDelete"
  }

}