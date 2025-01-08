variable "vnet_name" {
  description = "The name of the virtual network"
  type        = string
}

variable "vnet_resource_group_name" {
  description = "The name of the resource group in which the virtual network will be created"
  type        = string
}

variable "location" {
  description = "The location/region where the virtual network will be created"
  type        = string
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
}