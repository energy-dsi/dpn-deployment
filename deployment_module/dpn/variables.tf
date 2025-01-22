variable "location" {
  description = "The location/region where the resources will be deployed"
  type        = string
}

variable "ia_resource_group_name" {
  description = "The name of the resource group for the infrastructure as code deployment"
  type        = string
}

variable "tags" {
  description = "A map of tags to add to the resources"
  type        = map(string)
}

variable "cosmos_name" {
  description = "The name of the CosmosDB account"
  type        = string
}

variable "vnet_name" {
  description = "The name of the virtual network"
  type        = string
}

variable "vnet_cosmos_subnet_name" {
  description = "The name of the subnet for the CosmosDB account"
  type        = string
}

variable "vnet_resource_group_name" {
  description = "The name of the resource group for the virtual network"
  type        = string
}

variable "log_analytics_workspace_name" {
  description = "The name of the Log Analytics workspace"
  type        = string
}

variable "log_analytics_resource_group_name" {
  description = "The name of the resource group for the Log Analytics workspace"
  type        = string
}

variable "eventhub_name" {
  description = "The name of the Event Hub"
  type        = string
}

variable "vnet_eventhub_subnet_name" {
  description = "The name of the subnet for the Event Hub"
  type        = string
}

variable "aks_name" {
  description = "The name of the AKS cluster"
  type        = string
}

variable "aks_private_dns_name" {
  description = "The resource name of the private DNS zone"
  default     = "privatelink.uks.azmk8s.io"
  type        = string
}

variable "vnet_aks_subnet_name" {
  description = "The name of the subnet for the AKS cluster"
  type        = string
}

variable "aks_admin_group" {
  description = "The object ID of the Azure AD group that will be the AKS admin"
  type        = list(string)
  default     = []
}

variable "service_cidr" {
  description = "The service CIDR for the AKS cluster"
  type        = string
}

variable "dns_service_ip" {
  description = "The DNS service IP for the AKS cluster"
  type        = string
}

variable "aks_rbac_principal_id" {
  description = "Object ID of the principal to assign the AKS cluster admin role"
  type        = string
}

variable "node_count" {
  description = "Number of nodes in the default node pool"
  type        = number
}

variable "vm_size" {
  description = "Size of the VM for AKS cluster"
  type        = string
}

variable "acr_name" {
  description = "The name of the Azure Container Registry"
  type        = string
}

variable "eventhub_private_dns_zone_name" {
  description = "The resource name of the private DNS zone"
  default     = "privatelink.servicebus.windows.net"
  type        = string
}

variable "cosmosdb_private_dns_zone_name" {
  description = "The resource name of the private DNS zone"
  default     = "privatelink.mongo.cosmos.azure.com"
  type        = string
}

variable "storage_account_name" {
  description = "The name of the storage account"
  type        = string
}

variable "account_replication_type" {
  description = "The replication type for the storage account"
  type        = string
}

variable "account_tier" {
  description = "The tier for the storage account"
  type        = string
}
