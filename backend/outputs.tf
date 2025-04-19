output "tfstate_storage_account_name" {
  value       = azurerm_storage_account.tfstate-storage.name
  description = "The name of the storage account"
}