#VARIABLES
############################
variable "client_secret" {}

provider "azurerm" {
  version = 1.38

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