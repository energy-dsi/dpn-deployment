variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Location of the resource"
  type        = string
  default     = "UKSouth"
}

variable "aks_name" {
  description = "Name of the AKS cluster"
  type        = string
}

variable "private_dns_zone_id" {
  description = " Resource ID of the private DNS zone eg. /subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-aks/providers/Microsoft.Network/privateDnsZones/privatelink.westus2.azmk8s.io"
  type        = string
}

variable "vm_size" {
  description = "Size of the VM"
  type        = string
  default     = "Standard_DS2_v2"
}

variable "vnet_subnet_name" {
  description = "Name of the aks subnet"
  type        = string
}

variable "vnet_resource_group_name" {
  description = "Name of the resource group where the vnet is located"
  type        = string
}

variable "vnet_name" {
  description = "Name of the vnet"
  type        = string
}

variable "aks_admin_group" {
  description = "Object ID of the Azure AD group that will be the AKS admin"
  type        = list(string)
  default     = []
}

variable "log_analytics_workspace_name" {
  description = "Name of the Log Analytics workspace"
  type        = string
}

variable "log_analytics_resource_group_name" {
  description = "Name of the resource group where the Log Analytics workspace is located"
  type        = string
}

variable "tags" {
  description = "Tags for the resource"
  type        = map(string)
}

variable "service_cidr" {
  description = "CIDR block for the service network"
  type        = string
}

variable "dns_service_ip" {
  description = "IP address within the Kubernetes service address range that will be used by cluster service discovery (kube-dns)"
  type        = string
}

variable "node_count" {
  description = "Number of nodes in the default node pool"
  type        = number
  default     = 3
}