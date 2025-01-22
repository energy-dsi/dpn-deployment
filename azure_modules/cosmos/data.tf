data "azurerm_subnet" "aks_subnet" {
  name                 = var.vnet_subnet_name
  resource_group_name  = var.vnet_resource_group_name
  virtual_network_name = var.vnet_name
}

data "azurerm_log_analytics_workspace" "log_analytics" {
  name                = var.log_analytics_workspace_name
  resource_group_name = var.log_analytics_resource_group_name
}

data "azurerm_resource_group" "current" {
  name = var.resource_group_name
}

data "azurerm_subscription" "current" {}