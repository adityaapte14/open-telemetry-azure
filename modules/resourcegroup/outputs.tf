output "name" {
  description = "Name of resource group"
  value       = azurerm_resource_group.this.name
}

output "id" {
  description = "Resource Group ID"
  value       = azurerm_resource_group.this.id 
}