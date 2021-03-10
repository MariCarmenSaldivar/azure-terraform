resource "azurerm_data_factory" "dtdev" {
  name                = "dtdemodev"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  depends_on          = [azurerm_resource_group.rg]
}