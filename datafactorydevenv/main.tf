variable "client_secret" {}
variable "location" {}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}

  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}

#Configuration of blobstorage to save our tfstate file
terraform {
  backend "azurerm" {
    resource_group_name  = var.rgstoragetfplan
    storage_account_name = var.stgaccttfplan
    container_name       = var.containernametfplan
    key                  = var.keynametfplan
  }
}

#Create resource group to start our lab
resource "azurerm_resource_group" "rg" {
  name     = "rg-env-${terraform.workspace}"
  location = var.location

  tags = {
    "environment"     = var.location
    "costcenter"      = "it"
    "developmentteam" = "mary"
  }
}