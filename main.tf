terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~>4.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "tfstate"
    storage_account_name = "tfstatefc6mj"
    container_name       = "tfstate"
    key                 = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}

module "resourcegroup" {
  source   = "./modules/resourcegroup"
  name     = "aks-resource-group"
  location = "West Europe"
}

module "vnet" {
  source              = "./modules/vnet"
  name                = "aks-vnet"
  location            = "West Europe"
  resource_group_name = module.resourcegroup.name

  address_space = ["10.0.0.0/16"]

  subnets = [
    {
      name           = "subnet-system"
      address_prefix = "10.0.1.0/24"
    },
    {
      name           = "subnet-user"
      address_prefix = "10.0.2.0/24"
    }
  ]
}

module "aks" {
  source              = "./modules/aks"

  cluster_name        = "aks-cluster"
  location            = "West Europe"
  resource_group_name = module.resourcegroup.name
  dns_prefix          = "aksdemo"

  kubernetes_version  = "1.29.2"

  system_node_vm_size = "Standard_DS2_v2"
  system_node_count   = 1
  system_subnet_id    = module.vnet.subnet_ids["subnet-system"]

  user_node_vm_size   = "Standard_DS2_v2"
  user_node_count     = 1
  user_subnet_id      = module.vnet.subnet_ids["subnet-user"]


  tags = {
    environment = "dev"
    owner       = "terraform"
  }
}