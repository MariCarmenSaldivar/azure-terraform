#Get resources by type
data "azurerm_resources" "storageaccount" {
  type = "Microsoft.Storage/storageAccounts"
  name = "storagetfaccount"

  required_tags = {
    "costcenter"      = "it"
    "developmentteam" = "b2b"
  }
}

resource "azurerm_storage_container" "lab" {
  name                  = "blobcontainer4lab"
  storage_account_name  = data.azurerm_resources.storageaccount.name
  container_access_type = "private"
  depends_on            = [azurerm_storage_account.sa]
}

resource "azurerm_storage_blob" "lab" {
  name                   = "terraformblob"
  storage_account_name   = data.azurerm_resources.storageaccount.name
  storage_container_name = azurerm_storage_container.lab.name
  type                   = "Block"
  depends_on             = [azurerm_storage_container.lab]
}

resource "azurerm_storage_share" "lab" {
  name                 = "terraformshare"
  storage_account_name = data.azurerm_resources.storageaccount.name
  quota                = 50
  depends_on           = [azurerm_storage_account.sa]
}