variable "location" {
  description = "The Azure Region in which all resources will be created."
  type        = string
  default     = "UKSouth"
}

variable "name" {
  description = "The name of the CosmosDB account."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which the CosmosDB account will be created."
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the resources."
  type        = map(string)
}

variable "failover_location" {
  description = "The Azure Region in which the failover location will be created."
  type        = string
  default     = "UKWest"
}

variable "vnet_subnet_name" {
  description = "The name of the subnet in which the CosmosDB account will be created."
  type        = string
}

variable "vnet_resource_group_name" {
  description = "The name of the resource group in which the subnet is located."
  type        = string
}

variable "vnet_name" {
  description = "The name of the virtual network in which the subnet is located."
  type        = string
}

variable "log_analytics_workspace_name" {
  description = "The name of the Log Analytics workspace to use for diagnostics."
  type        = string
}

variable "log_analytics_resource_group_name" {
  description = "The name of the resource group in which the Log Analytics workspace is located."
  type        = string
}

variable "cosmosdb_private_dns_zone_id" {
  description = "ID of the private DNS zone for the CosmosDB account."
  type        = string
}