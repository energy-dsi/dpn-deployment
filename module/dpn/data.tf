
data "azurerm_private_dns_zone" "aks_dns_zone" {
  name                = var.aks_private_dns_name
  resource_group_name = var.vnet_resource_group_name
}

data "azurerm_subscription" "current" {
}

data "azurerm_private_dns_zone" "eventhub_dns_zone" {
  name                = var.eventhub_private_dns_zone_name
  resource_group_name = var.vnet_resource_group_name
}

data "azurerm_private_dns_zone" "cosmos_dns_zone" {
  name                = var.cosmosdb_private_dns_zone_name
  resource_group_name = var.vnet_resource_group_name
}