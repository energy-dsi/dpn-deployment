vnet_resource_group_name          = "rg-vnet-dpn-sbx-uksouth"
location                          = "uksouth"
vnet_name                         = "vnet-dpn-sbx-uksouth-001"
log_analytics_workspace_name      = "law-dpn-sbx-uksouth-001"
log_analytics_resource_group_name = "rg-law-dpn-sbx-uksouth"
tags = {
  environment = "sandbox"
  project     = "dpn"
  _purpose    = "Client Development"
  _business_criticality = "Low"
  _end_date = "31/12/2025"
  _owner_email = "viral.patel@mesh-ai.com"
}