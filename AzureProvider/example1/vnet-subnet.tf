resource "azurerm_virtual_network" "tfNet" {
  name                = "myvnet"
  address_space       = ["10.0.0.0/16"]
  location            = "centralus"
  resource_group_name = var.ResourceGroup
  depends_on          = [azurerm_resource_group.rgdev]

  tags = {
    "environment" = "dev"
  }
}

#Create a subnet
resource "azurerm_subnet" "tfsubnet" {
  name                 = "subnet1"
  resource_group_name  = var.ResourceGroup
  virtual_network_name = azurerm_virtual_network.tfNet.name
  address_prefix       = "10.0.1.0/24"
}

resource "azurerm_subnet" "tfsubnet2" {
  name                 = "subnet2"
  resource_group_name  = var.ResourceGroup
  virtual_network_name = azurerm_virtual_network.tfNet.name
  address_prefix       = "10.0.2.0/24"
}