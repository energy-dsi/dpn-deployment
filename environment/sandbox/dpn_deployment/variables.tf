variable "ARM_CLIENT_ID" {
  description = "The client ID of the service principal"
  type        = string
}

variable "ARM_CLIENT_SECRET" {
  description = "The client secret of the service principal"
  type        = string
}

variable "ARM_SUBSCRIPTION_ID" {
  description = "The subscription ID"
  type        = string
}

variable "ARM_TENANT_ID" {
  description = "The tenant ID"
  type        = string
}

variable "location" {
  description = "The location of the resources"
  type        = string
}

variable "ia_resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "tags" {
  description = "The tags for the resources"
  type        = map(string)
}

variable "cosmos_name" {
  description = "The name of the Cosmos DB account"
  type        = string
}

variable "vnet_name" {
  description = "The name of the VNet"
  type        = string
}

variable "vnet_cosmos_subnet_name" {
  description = "The name of the subnet for the Cosmos DB account"
  type        = string
}

variable "vnet_resource_group_name" {
  description = "The name of the resource group for the VNet"
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

variable "vnet_aks_subnet_name" {
  description = "The name of the subnet for the AKS cluster"
  type        = string
}

variable "aks_admin_group" {
  description = "The name of the admin group for the AKS cluster"
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

variable "aks_private_dns_name" {
  description = "The resource name of the private DNS zone"
  type        = string
}

variable "aks_rbac_principal_id" {
  description = "Object ID of the principal to assign the AKS cluster admin role"
  type        = string
}

variable "node_count" {
  description = "The number of nodes in the AKS cluster"
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

variable "helm_identity_name" {
  description = "The name of the identity to assign to the Helm service account"
  type        = string
}