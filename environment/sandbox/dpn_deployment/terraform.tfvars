vnet_resource_group_name          = "rg-vnet-dpn-sbx-uksouth"
location                          = "uksouth"
vnet_name                         = "vnet-dpn-sbx-uksouth-001"
log_analytics_workspace_name      = "law-dpn-sbx-uksouth-001"
log_analytics_resource_group_name = "rg-law-dpn-sbx-uksouth"
tags = {
  environment = "sandbox"
  project     = "dpn"
}

ia_resource_group_name    = "rg-ia-dpn-sbx-uksouth-001"
cosmos_name               = "cosmos-dpn-sbx-uksouth-001"
vnet_cosmos_subnet_name   = "cosmos"
eventhub_name             = "eventhub-dpn-sbx-uksouth-001"
vnet_eventhub_subnet_name = "eventhub"
aks_name                  = "aks-dpn-sbx-uksouth-001"
vnet_aks_subnet_name      = "aks"
aks_admin_group           = ["85bafe9a-2b95-4ed6-83ba-8f280206d45a"] #azg-azure-dsi-lzteam
aks_private_dns_name      = "privatelink.uks.azmk8s.io"
service_cidr              = "10.0.6.0/24"
dns_service_ip            = "10.0.6.10"
aks_rbac_principal_id     = "85bafe9a-2b95-4ed6-83ba-8f280206d45a" #azg-azure-dsi-lzteam
node_count                = 4
vm_size                   = "Standard_DS4_v2"
acr_name                  = "acrdpnsbxuksouth001"