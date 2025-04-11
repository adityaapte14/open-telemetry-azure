output "vnet_name" {
  description = "Name of the virtual network"
  value       = azurerm_virtual_network.this.name
}

output "vnet_id" {
  description = "ID of the virtual network"
  value       = azurerm_virtual_network.this.id
}

output "subnet_ids" {
  description = "Map of subnet names to their IDs"
  value = {
    for subnet in azurerm_subnet.this : subnet.name => subnet.id
  }
}

output "subnet_names" {
  description = "Map of subnet names to their names (useful for reference)"
  value = {
    for k, s in azurerm_subnet.this : k => s.name
  }
}
