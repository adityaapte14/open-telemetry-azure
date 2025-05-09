resource "azurerm_virtual_network" "this" {
  name                 = var.name
  location             = var.location
  address_space        = var.address_space
  resource_group_name  = var.resource_group_name
}

resource "azurerm_subnet" "this" {
  for_each             = { for s in var.subnets : s.name => s }
  name                 = each.value.name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = [each.value.address_prefix]
}