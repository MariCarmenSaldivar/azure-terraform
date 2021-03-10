resource "azurerm_storage_account" "sadfdev" {
  name                     = "storagedfdevdemo"
  account_tier             = "Standard"
  account_kind             = "StorageV2"
  account_replication_type = "RAGRS"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  allow_blob_public_access = true
}

resource "azurerm_storage_container" "containerraw" {
  name                  = "dfraw"
  storage_account_name  = "storagedfdevdemo"
  container_access_type = "container"
  depends_on            = [azurerm_storage_account.sadfdev]
}
resource "azurerm_storage_container" "containercurated" {
  name                  = "dfcurated"
  storage_account_name  = "storagedfdevdemo"
  container_access_type = "container"
  depends_on            = [azurerm_storage_account.sadfdev]
}