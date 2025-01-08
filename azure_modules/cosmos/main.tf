resource "azurerm_cosmosdb_account" "mongo_instance" {
  location            = var.location
  name                = var.name
  offer_type          = "Standard"
  resource_group_name = var.resource_group_name
  kind                = "MongoDB"
  consistency_policy {
    consistency_level = "Strong"
  }
  geo_location {
    zone_redundant    = false #UK West currently does not support zone redundant
    failover_priority = 0
    location          = var.failover_location
  }
  #local_authentication_disabled = true
  mongo_server_version          = "7.0"
  tags                          = var.tags

}

resource "azurerm_monitor_diagnostic_setting" "cosmos_diagnostic" {
  name = "${var.name}-diagnostic"
  target_resource_id         = azurerm_cosmosdb_account.mongo_instance.id
  log_analytics_workspace_id = data.azurerm_log_analytics_workspace.log_analytics.id

  metric {
    category = "AllMetrics"
    enabled  = true
  }

  enabled_log {
    category_group = "allLogs"
  }

}


resource "azurerm_private_endpoint" "cosmos_endpoint" {
  #count               = local.sandbox_subscription == true ? 0 : 1
  name                = "${var.name}-endpoint"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = data.azurerm_subnet.aks_subnet.id

  private_service_connection {
    name = "${var.name}-connection"
    private_connection_resource_id = azurerm_cosmosdb_account.mongo_instance.id
    subresource_names              = ["MongoDB"]
    is_manual_connection           = false
  }

  private_dns_zone_group {
    name                 = "default"
    private_dns_zone_ids = [var.cosmosdb_private_dns_zone_id]
  }

  tags       = var.tags
}