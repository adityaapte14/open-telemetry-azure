variable "cluster_name" {
  description = "Name of the AKS cluster"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "dns_prefix" {
  description = "DNS prefix for the AKS API"
  type        = string
}

variable "kubernetes_version" {
  description = "AKS Kubernetes version"
  type        = string
  default     = "1.29.2"
}

# System Node Pool
variable "system_node_vm_size" {
  type        = string
  default     = "Standard_DS2_v2"
}
variable "system_node_count" {
  type        = number
  default     = 1
}
variable "system_subnet_id" {
  type        = string
}

# User Node Pool
variable "user_node_vm_size" {
  type        = string
  default     = "Standard_DS2_v2"
}
variable "user_node_count" {
  type        = number
  default     = 1
}
variable "user_subnet_id" {
  type        = string
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}
