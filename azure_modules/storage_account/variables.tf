variable "storage_account_name" {
  description = "The name of the storage account"
  type        = string
}

variable "storage_resource_group_name" {
  description = "The name of the resource group where the storage account will be created"
  type        = string
}

variable "location" {
  description = "The location of the storage account"
  type        = string
  default     = "UKSouth"
}

variable "account_tier" {
  description = "The storage account tier"
  type        = string
}

variable "account_replication_type" {
  description = "The storage account replication type"
  type        = string
}

variable "public_network_access_enabled" {
  description = "Whether or not public network access is enabled for the storage account"
  type        = bool
}

variable "tags" {
  description = "A map of tags to add to the storage account"
  type        = map(string)
}

variable "log_analytics_workspace_name" {
  description = "The name of the Log Analytics workspace to use for diagnostics."
  type        = string
}

variable "log_analytics_resource_group_name" {
  description = "The name of the resource group in which the Log Analytics workspace is located."
  type        = string
}