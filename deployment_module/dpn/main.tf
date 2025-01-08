resource "azurerm_resource_group" "ia_resource_group" {
  location = var.location
  name     = var.ia_resource_group_name
  tags     = var.tags
}


module "ia_cosmos" {
  source                            = "../../azure_modules/cosmos"
  name                              = var.cosmos_name
  resource_group_name               = azurerm_resource_group.ia_resource_group.name
  location                          = var.location
  vnet_name                         = var.vnet_name
  vnet_subnet_name                  = var.vnet_cosmos_subnet_name
  vnet_resource_group_name          = var.vnet_resource_group_name
  log_analytics_resource_group_name = var.log_analytics_resource_group_name
  log_analytics_workspace_name      = var.log_analytics_workspace_name
  tags                              = var.tags
  depends_on                        = [azurerm_resource_group.ia_resource_group]
  cosmosdb_private_dns_zone_id      = data.azurerm_private_dns_zone.cosmos_dns_zone.id
}

module "ia_eventhub" {
  source                            = "../../azure_modules/eventhub"
  location                          = var.location
  name                              = var.eventhub_name
  resource_group_name               = azurerm_resource_group.ia_resource_group.name
  vnet_name                         = var.vnet_name
  vnet_subnet_name                  = var.vnet_eventhub_subnet_name
  vnet_resource_group_name          = var.vnet_resource_group_name
  log_analytics_resource_group_name = var.log_analytics_resource_group_name
  log_analytics_workspace_name      = var.log_analytics_workspace_name
  tags                              = var.tags
  eventhub_private_dns_zone_id      = data.azurerm_private_dns_zone.eventhub_dns_zone.id
}

module "ia_acr" {
  source                            = "../../azure_modules/container_registry"
  acr_name                          = var.acr_name
  location                          = var.location
  log_analytics_resource_group_name = var.log_analytics_resource_group_name
  log_analytics_workspace_name      = var.log_analytics_workspace_name
  resource_group_name               = azurerm_resource_group.ia_resource_group.name
  tags                              = var.tags
}

resource "azurerm_role_assignment" "acr_pull_role" {
  scope                = module.ia_acr.acr_container_registry.id
  role_definition_name = "AcrPull"
  principal_id         = module.ia_aks.aks.kubelet_identity[0].object_id
  depends_on           = [module.ia_acr]
}

resource "azurerm_role_assignment" "aks_role_assignment" {
  scope                = data.azurerm_subscription.current.id
  role_definition_name = "Azure Kubernetes Service RBAC Cluster Admin"
  principal_id         = var.aks_rbac_principal_id
}

module "ia_aks" {
  source                            = "../../azure_modules/aks"
  aks_name                          = var.aks_name
  resource_group_name               = azurerm_resource_group.ia_resource_group.name
  location                          = var.location
  private_dns_zone_id               = data.azurerm_private_dns_zone.aks_dns_zone.id
  vnet_subnet_name                  = var.vnet_aks_subnet_name
  vnet_resource_group_name          = var.vnet_resource_group_name
  vnet_name                         = var.vnet_name
  aks_admin_group                   = var.aks_admin_group
  log_analytics_resource_group_name = var.log_analytics_resource_group_name
  log_analytics_workspace_name      = var.log_analytics_workspace_name
  tags                              = var.tags
  service_cidr                      = var.service_cidr
  dns_service_ip                    = var.dns_service_ip
  node_count                        = var.node_count
  vm_size                           = var.vm_size
}

resource "azurerm_eventhub" "knowledge" {
  name                = "knowledge"
  namespace_name      = module.ia_eventhub.eventhub_namespace.name
  resource_group_name = module.ia_eventhub.eventhub_namespace.resource_group_name
  partition_count     = 1
  message_retention   = 1
  depends_on          = [module.ia_eventhub]
}

resource "azurerm_eventhub" "ontology" {
  name                = "ontology"
  namespace_name      = module.ia_eventhub.eventhub_namespace.name
  resource_group_name = module.ia_eventhub.eventhub_namespace.resource_group_name
  partition_count     = 1
  message_retention   = 1
  depends_on          = [module.ia_eventhub]
}

resource "azurerm_eventhub" "federated-knowledge-filtered-dlq" {
  name                = "federated-knowledge-filtered-dlq"
  namespace_name      = module.ia_eventhub.eventhub_namespace.name
  resource_group_name = module.ia_eventhub.eventhub_namespace.resource_group_name
  partition_count     = 1
  message_retention   = 1
  depends_on          = [module.ia_eventhub]
}

resource "azurerm_eventhub" "federated-knowledge-filtered" {
  name                = "federated-knowledge-filtered"
  namespace_name      = module.ia_eventhub.eventhub_namespace.name
  resource_group_name = module.ia_eventhub.eventhub_namespace.resource_group_name
  partition_count     = 1
  message_retention   = 1
  depends_on          = [module.ia_eventhub]
}