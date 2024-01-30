terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.88.0"
    }
  }

 # backend "azurerm" {
 #     resource_group_name  = "rg-sandbox-lgo"
 #     storage_account_name = "lgo-sa"
 #     container_name       = "tfstate"
 #     key                  = "terraform.tfstate"
 #     access_key           = "NgLSWbF2ojeknW1lQivV4uqyVCEjdzjATIyfiQCBqi/4XP7hcjkXM9TgdK2C4uwnL5appHnCrtyl+AStQ3kqdA=="
 # }
}

data "azurerm_client_config" "current" {}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  skip_provider_registration = true # This is only required when the User, Service Principal, or Identity running Terraform lacks the permissions to register Azure Resource Providers.
  features {}
}