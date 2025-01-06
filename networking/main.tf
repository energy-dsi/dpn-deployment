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
  location = ""
  tags = {}
  vnet_name = ""
  vnet_resource_group_name = ""
}