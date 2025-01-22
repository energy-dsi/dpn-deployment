variable "log_analytics_workspace_name" {
  description = "The name of the Log Analytics Workspace"
  type        = string
}

variable "location" {
  description = "The location of the Log Analytics Workspace"
  type        = string
}

variable "log_analytics_resource_group_name" {
  description = "The name of the Resource Group where the Log Analytics Workspace will be created"
  type        = string
}

variable "tags" {
  description = "A map of tags to add to the Log Analytics Workspace"
  type        = map(string)
}