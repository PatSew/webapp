terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.0.1"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-tfstate-webapp-staging"
    storage_account_name = "stclgq9ijnda"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}
