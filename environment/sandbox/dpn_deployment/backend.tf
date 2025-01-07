terraform {
  backend "azurerm" {
    resource_group_name  = "viral-rg"
    storage_account_name = "vptfstorageaccount001"
    container_name       = "tfstate"
    key                  = "terraform_ia_deployment.tfstate"
  }
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}

provider "azurerm" {
  features {}

  subscription_id = var.ARM_SUBSCRIPTION_ID
  client_id       = var.ARM_CLIENT_ID
  client_secret   = var.ARM_CLIENT_SECRET
  tenant_id       = var.ARM_TENANT_ID
}