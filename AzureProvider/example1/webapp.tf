resource "azurerm_app_service_plan" "svplan" {
  name                = "newweb-appserviceplan"
  location            = var.location
  resource_group_name = var.ResourceGroup

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "appsvc" {
  name                = "custom-tf-webapp"
  resource_group_name = var.ResourceGroup
  location            = var.location
  app_service_plan_id = azurerm_app_service_plan.svplan.id
  site_config {
    dotnet_framework_version = "v4.0"
    scm_type                 = "LocalGit"
  }
}