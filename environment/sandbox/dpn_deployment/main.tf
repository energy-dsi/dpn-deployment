module "ia_deployment_sandbox" {
  source                            = "../../../deployment_module/dpn"
  location                          = var.location
  ia_resource_group_name            = var.ia_resource_group_name
  tags                              = var.tags
  cosmos_name                       = var.cosmos_name
  vnet_name                         = var.vnet_name
  vnet_cosmos_subnet_name           = var.vnet_cosmos_subnet_name
  vnet_resource_group_name          = var.vnet_resource_group_name
  log_analytics_workspace_name      = var.log_analytics_workspace_name
  log_analytics_resource_group_name = var.log_analytics_resource_group_name
  eventhub_name                     = var.eventhub_name
  vnet_eventhub_subnet_name         = var.vnet_eventhub_subnet_name
  aks_name                          = var.aks_name
  vnet_aks_subnet_name              = var.vnet_aks_subnet_name
  aks_admin_group                   = var.aks_admin_group
  service_cidr                      = var.service_cidr
  dns_service_ip                    = var.dns_service_ip
  aks_private_dns_name              = var.aks_private_dns_name
  aks_rbac_principal_id             = var.aks_rbac_principal_id
  node_count                        = var.node_count
  vm_size                           = var.vm_size
  acr_name                          = var.acr_name
}