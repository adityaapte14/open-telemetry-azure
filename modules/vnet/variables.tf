variable "name" {
  description = "Name of Virtual Network"
  type        = string
}

variable "location" {
  description = "Azure region where the VNet will be created"
  type        = string
}

variable "resource_group_name" {
  description = "Name of resource group where the VNet will be deployed"
  type        = string
}

variable "address_space" {
  description = "The address space that is used by the virtual network"
  type        = list(string)
}

variable "subnets" {
  description = "List of subnets to be created within the VNet"
  type        = list(object({
    name           = string
    address_prefix = string
  }))
}