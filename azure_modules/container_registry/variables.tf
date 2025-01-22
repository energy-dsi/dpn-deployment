variable "acr_name" {
  type        = string
  description = "The name of the Azure Container Registry"
}

variable "location" {
  type        = string
  description = "The location of the Azure Container Registry"
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group for the Azure Container Registry"
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to assign to the Azure Container Registry"
}

variable "log_analytics_workspace_name" {
  type        = string
  description = "The name of the Log Analytics workspace"
}

variable "log_analytics_resource_group_name" {
  type        = string
  description = "The name of the resource group for the Log Analytics workspace"
}