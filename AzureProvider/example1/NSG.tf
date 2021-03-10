resource "azurerm_network_security_group" "nsg" {
  name                = "myNSG"
  location            = "centralus"
  resource_group_name = var.ResourceGroup
  depends_on          = [azurerm_resource_group.rgdev, azurerm_virtual_network.tfNet]
}

resource "azurerm_network_security_rule" "example1" {
  name                        = "Web80"
  priority                    = 1001
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "80"
  destination_address_prefix  = "*"
  source_address_prefix       = "*"
  resource_group_name         = var.ResourceGroup
  network_security_group_name = azurerm_network_security_group.nsg.name
}

resource "azurerm_network_security_rule" "example2" {
  name                        = "Web8080"
  priority                    = 1000
  direction                   = "Inbound"
  access                      = "Deny"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "8080"
  destination_address_prefix  = "*"
  source_address_prefix       = "*"
  resource_group_name         = var.ResourceGroup
  network_security_group_name = azurerm_network_security_group.nsg.name
}

resource "azurerm_network_security_rule" "example3" {
  name                        = "Webout"
  direction                   = "Outbound"
  priority                    = 1000
  access                      = "Deny"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "80"
  destination_address_prefix  = "*"
  source_address_prefix       = "*"
  resource_group_name         = var.ResourceGroup
  network_security_group_name = azurerm_network_security_group.nsg.name
}