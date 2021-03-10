data "azurerm_subnet" "tfsubnet" {
  name                 = "subnet1"
  virtual_network_name = "myvnet"
  resource_group_name  = var.ResourceGroup
}

resource "azurerm_public_ip" "ip" {
  name                = "pubip1"
  location            = var.location
  resource_group_name = var.ResourceGroup
  allocation_method   = "Dynamic"
  sku                 = "Basic"
}

resource "azurerm_network_interface" "nic" {
  name                = "forge-nic"
  location            = var.location
  resource_group_name = var.ResourceGroup

  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = data.azurerm_subnet.tfsubnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.ip.id
  }
}

# resource "azurerm_storage_account" "sa" {
#   name                     = "forgebootdiags123"
#   resource_group_name      = var.ResourceGroup
#   location                 = var.location
#   account_tier             = "Standard"
#   account_replication_type = "LRS"
# }

resource "azurerm_virtual_machine" "vmexample" {
  name                             = "forge"
  location                         = var.location
  resource_group_name              = var.ResourceGroup
  network_interface_ids            = [azurerm_network_interface.nic.id]
  vm_size                          = "Standard_B1s"
  delete_os_disk_on_termination    = true
  delete_data_disks_on_termination = false

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name              = "osdisk1"
    disk_size_gb      = "128"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "forge"
    admin_username = "vmadmin"
    admin_password = "Password12345!"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  boot_diagnostics {
    enabled     = "true"
    storage_uri = azurerm_storage_account.sa.primary_blob_endpoint
  }
}