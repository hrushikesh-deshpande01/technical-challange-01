provider "azurerm" {
  features {}
}

locals {
    storage_account_name = "sa_${var.tenant_short}_${var.env_short}_${var.resource_suffix_short}"
    rg_name ="rg-${var.tenant_short}_${var.env_short}_${var.resource_suffix_short}"
    mssql_server_name = "server_${var.tenant_short}_${var.env_short}_${var.resource_suffix_short}"
    mssql_database_name ="db-${var.tenant_short}_${var.env_short}_${var.resource_suffix_short}"
}

resource "azurerm_resource_group" "this" {
  name     = "${local.rg_name}"
  location = "${var.location}"
  tags = {
    type = "${var.type}"
    tenant = "${var.tenant}"
    env = "${var.env}"
  }
}

resource "azurerm_storage_account" "this" {
  name                     = "${local.storage_account_name}"
  resource_group_name      = azurerm_resource_group.this.name
  location                 = azurerm_resource_group.this.location
  account_tier             = "${var.account_tier}"
  account_replication_type = "${var.account_replication_type}"
}

resource "azurerm_mssql_server" "this" {
  name                         = "${local.mssql_server_name}"
  resource_group_name          = azurerm_resource_group.this.name
  location                     = azurerm_resource_group.this.location
  version                      = "${var.version}"
  administrator_login          = "${var.user}"
  administrator_login_password = "${var.password}"
}

resource "azurerm_mssql_database" "this" {
  name           = "${local.mssql_database_name}"
  server_id      = azurerm_mssql_server.this.id
  collation      = "${var.collation}"
  license_type   = "${var.license_type}"
  max_size_gb    =  ${var.max_size_gb}
  read_scale     =  ${var.read_scale}
  sku_name       = "${var.sku_name}"
  zone_redundant = ${var.zone_redundant}

}