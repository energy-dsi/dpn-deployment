resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  resource_group_name = var.vnet_resource_group_name
  location            = var.location
  address_space       = ["10.0.0.0/16"]

  subnet {
    name             = "aks"
    address_prefixes = ["10.0.2.0/24"]
  }

  subnet {
    name             = "redis"
    address_prefixes = ["10.0.3.0/24"]
  }

  subnet {
    name             = "cosmos"
    address_prefixes = ["10.0.4.0/24"]

  }

  subnet {
    name             = "eventhub"
    address_prefixes = ["10.0.5.0/24"]
  }

  tags = var.tags

}

resource "azurerm_private_dns_zone" "aks" {
  name                = "privatelink.uks.azmk8s.io"
  resource_group_name = var.vnet_resource_group_name
  tags                = var.tags
}

resource "azurerm_private_dns_zone_virtual_network_link" "aks" {
  name                  = "privatelink.uks.azmk8s.io"
  resource_group_name   = var.vnet_resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.aks.name
  virtual_network_id    = azurerm_virtual_network.vnet.id
}

resource "azurerm_private_dns_zone" "redis" {
  name                = "privatelink.redis.cache.windows.net"
  resource_group_name = var.vnet_resource_group_name
  tags                = var.tags
}

resource "azurerm_private_dns_zone_virtual_network_link" "redis" {
  name                  = "privatelink.redis.cache.windows.net"
  resource_group_name   = var.vnet_resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.redis.name
  virtual_network_id    = azurerm_virtual_network.vnet.id
}

resource "azurerm_private_dns_zone" "cosmos" {
  name                = "privatelink.mongo.cosmos.azure.com"
  resource_group_name = var.vnet_resource_group_name
  tags                = var.tags
}

resource "azurerm_private_dns_zone_virtual_network_link" "cosmos" {
  name                  = "privatelink.mongo.cosmos.azure.com"
  resource_group_name   = var.vnet_resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.cosmos.name
  virtual_network_id    = azurerm_virtual_network.vnet.id
}

resource "azurerm_private_dns_zone" "eventhub" {
  name                = "privatelink.servicebus.windows.net"
  resource_group_name = var.vnet_resource_group_name
  tags                = var.tags
}

resource "azurerm_private_dns_zone_virtual_network_link" "eventhub" {
  name                  = "privatelink.servicebus.windows.net"
  resource_group_name   = var.vnet_resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.eventhub.name
  virtual_network_id    = azurerm_virtual_network.vnet.id
}