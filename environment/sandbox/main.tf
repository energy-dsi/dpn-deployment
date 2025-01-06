module "core_services" {
  source                            = "../../module/"
  log_analytics_resource_group_name = var.log_analytics_resource_group_name
  log_analytics_workspace_name      = var.log_analytics_workspace_name
  virtual_resource_group_name       = var.vnet_resource_group_name
  vnet_name                         = var.vnet_name
}