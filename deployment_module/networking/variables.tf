variable "virtual_resource_group_name" {
  description = "The name of the resource group"
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