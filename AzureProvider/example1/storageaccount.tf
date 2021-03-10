##VARIABLES
########################################
variable "region" {
  default = "centralus"
}

variable "ResourceGroup" {
}

variable "storage_account_name" {
  default = "storagetfaccount"
}

resource "azurerm_storage_account" "sa" {
  name                     = var.storage_account_name
  resource_group_name      = var.ResourceGroup
  location                 = var.region
  account_tier             = "Standard"
  account_replication_type = "GRS"
  depends_on               = [azurerm_resource_group.rgdev]

  tags = {
    costcenter      = "it"
    developmentteam = "b2b"
  }
}
