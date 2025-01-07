resource "azurerm_resource_group" "virtual_network_resource_group" {
  location = var.location
  name     = var.virtual_resource_group_name
  tags     = var.tags
}

resource "azurerm_resource_group" "log_analytics_resource_group" {
  location = var.location
  name     = var.log_analytics_resource_group_name
  tags     = var.tags
}

module "virtual_network" {
  source = "git@github.com:energy-dsi/dpnModules.git//modules/networking?ref=main"
  location = var.location
  tags = var.tags
  vnet_name = var.vnet_name
  vnet_resource_group_name = azurerm_resource_group.virtual_network_resource_group.name
}

module "log_analytics" {
  source = "git@github.com:energy-dsi/dpnModules.git//modules/loganalytics?ref=main"
  location = var.location
  log_analytics_resource_group_name = azurerm_resource_group.log_analytics_resource_group.name
  log_analytics_workspace_name = var.log_analytics_workspace_name
  tags = var.tags
}