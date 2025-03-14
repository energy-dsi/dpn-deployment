resource "azurerm_eventhub_namespace" "eventhub_kafka" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Premium"
  #public_network_access_enabled = local.sandbox_subscription == true ? true : false
  public_network_access_enabled = false
  #local_authentication_enabled  = false
  capacity = 1
  tags     = var.tags

}

resource "azurerm_private_endpoint" "eventhub_endpoint" {
  location            = var.location
  name                = "${var.name}-endpoint"
  resource_group_name = var.resource_group_name
  subnet_id           = data.azurerm_subnet.aks_subnet.id

  private_service_connection {
    name                           = "${var.name}-connection"
    private_connection_resource_id = azurerm_eventhub_namespace.eventhub_kafka.id
    subresource_names              = ["namespace"]
    is_manual_connection           = false

  }

  private_dns_zone_group {
    name                 = "default"
    private_dns_zone_ids = [var.eventhub_private_dns_zone_id]
  }
}

resource "azurerm_monitor_diagnostic_setting" "eventhub_diagnostic" {
  name                       = "${var.name}-diagnostic"
  target_resource_id         = azurerm_eventhub_namespace.eventhub_kafka.id
  log_analytics_workspace_id = data.azurerm_log_analytics_workspace.log_analytics.id

  metric {
    category = "AllMetrics"
    enabled  = true
  }

  enabled_log {
    category_group = "allLogs"
  }

}