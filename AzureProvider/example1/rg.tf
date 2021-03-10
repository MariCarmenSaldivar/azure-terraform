variable "location" {
  default = "centralus"
}
variable "environment" {
  default = "dev"
}

resource "azurerm_resource_group" "rgdev" {
  name     = "rg-env-${var.environment}"
  location = var.location

  tags = {
    "environment"     = "Terraform"
    "costcenter"      = "it"
    "developmentteam" = "api"
  }
}