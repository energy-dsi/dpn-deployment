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
  description = "The location of the resource group"
  type        = string
  default     = "uksouth"
}

variable "vnet_name" {
  description = "The name of the virtual network"
  type        = string
}

variable "vnet_resource_group_name" {
  description = "The name of the resource group for the virtual network"
  type        = string
}

variable "log_analytics_workspace_name" {
  description = "The name of the log analytics workspace"
  type        = string
}

variable "log_analytics_resource_group_name" {
  description = "The name of the resource group for the log analytics workspace"
  type        = string
}

variable "tags" {
  description = "A map of tags to add to the resources"
  type        = map(string)
  default     = {}
}