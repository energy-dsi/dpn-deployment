vnet_resource_group_name          = ""
location                          = ""
vnet_name                         = ""
log_analytics_workspace_name      = ""
log_analytics_resource_group_name = ""
tags = {
  environment = ""
  project     = ""
}

ia_resource_group_name    = ""
cosmos_name               = ""
vnet_cosmos_subnet_name   = ""
eventhub_name             = ""
vnet_eventhub_subnet_name = ""
aks_name                  = ""
vnet_aks_subnet_name      = ""
aks_admin_group           = [""] #azg-azure-dsi-lzteam
aks_private_dns_name      = "privatelink.uks.azmk8s.io"
service_cidr              = ""
dns_service_ip            = ""
aks_rbac_principal_id     = "" #azg-azure-dsi-lzteam
node_count                = 4
vm_size                   = "Standard_DS4_v2"
acr_name                  = ""