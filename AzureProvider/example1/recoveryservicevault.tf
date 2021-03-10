resource "azurerm_recovery_services_vault" "vault" {
  name                = "terraform-recovery-vault"
  location            = "centralus"
  resource_group_name = var.ResourceGroup
  sku                 = "Standard"
  depends_on          = [azurerm_resource_group.rgdev]
}