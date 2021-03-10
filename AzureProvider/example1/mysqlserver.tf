resource "azurerm_mysql_server" "servermysql" {
    name="mysql-terraformserver-mary"
    location=var.location
    resource_group_name=var.ResourceGroup
    
    sku {
        name = "B_Gen5_2"
        capacity=2
        tier="Basic"
        family="Gen5"
    }
    
    storage_profile {
        storage_mb=5120
        backup_retention_days =7
        geo_redundant_backup="Disabled"
    }
    
    administrator_login ="mysqladminun"
    administrator_login_password="easytologing4once!"
    version="5.7"
    ssl_enforcement="Enabled"
}

resource "azurerm_mysql_database" "example" {
    name="exampledb"
    resource_group_name=var.ResourceGroup
    server_name=azurerm_mysql_server.servermysql.name
    charset="utf8"
    collation="utf8_unicode_ci"
}