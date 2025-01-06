module "core_services" {
  source                            = "../../core_modules"
  vnet_name                         = var.vnet_name
  virtual_resource_group_name       = var.vnet_resource_group_name
  log_analytics_workspace_name      = var.log_analytics_workspace_name
  log_analytics_resource_group_name = var.log_analytics_resource_group_name
  tags                              = var.tags
  location                          = var.location
}