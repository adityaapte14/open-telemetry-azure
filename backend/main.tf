terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~>4.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "random_string" "resource_code" {
  length  = 5
  special = false
  upper   = false
}

resource "azurerm_resource_group" "tfstate" {
  name     = "tfstate"
  location = "West Europe"
}

resource "azurerm_storage_account" "tfstate-storage" {
  name =  "tfstate${random_string.resource_code.result}"
  resource_group_name = azurerm_resource_group.tfstate.name
  location = azurerm_resource_group.tfstate.location
  account_tier = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "tfstate"
  }
}

resource "azurerm_storage_container" "tfstate" {
  name = "tfstate"
  storage_account_id = azurerm_storage_account.tfstate-storage.id
  container_access_type = "private"
}