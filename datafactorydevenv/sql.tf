resource "azurerm_sql_server" "dfexample" {
  name                         = "dfmssqlserver"
  resource_group_name          = azurerm_resource_group.rg.name
  location                     = azurerm_resource_group.rg.location
  version                      = "12.0"
  administrator_login          = "mradministrator"
  administrator_login_password = "thisIsDog11"

  #   extended_auditing_policy {
  #     storage_endpoint                        = azurerm_storage_account.example.primary_blob_endpoint
  #     storage_account_access_key              = azurerm_storage_account.example.primary_access_key
  #     storage_account_access_key_is_secondary = true
  #     retention_in_days                       = 6
  #   }
  tags = {
    "environment" = "test"
  }
}

resource "azurerm_mssql_database" "test" {
  name        = "df-db-dev"
  sample_name = "AdventureWorksLT"
  server_id   = azurerm_sql_server.dfexample.id
  collation   = "SQL_Latin1_General_CP1_CI_AS"
  max_size_gb = 2
  read_scale  = true
  sku_name    = "BC_Gen5_2"
  depends_on  = [azurerm_sql_server.dfexample]

  #   extended_auditing_policy {
  #     storage_endpoint                        = azurerm_storage_account.example.primary_blob_endpoint
  #     storage_account_access_key              = azurerm_storage_account.example.primary_access_key
  #     storage_account_access_key_is_secondary = true
  #     retention_in_days                       = 6
  #   }

  tags = {
    environment = "dev"
    sqlserver   = "dfmssqlserver"
  }
}