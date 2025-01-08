resource "azurerm_container_registry" "acr" {
  location            = var.location
  name                = var.acr_name
  resource_group_name = var.resource_group_name
  sku                 = "Standard"
  admin_enabled       = false
  tags                = var.tags
}

resource "azurerm_monitor_diagnostic_setting" "acr_diagnostic" {
  name                       = "${var.acr_name}-diagnostic"
  target_resource_id         = azurerm_container_registry.acr.id
  log_analytics_workspace_id = data.azurerm_log_analytics_workspace.log_analytics.id

  enabled_log {
    category_group = "allLogs"
  }

  metric {
    category = "AllMetrics"
    enabled  = true
  }
}