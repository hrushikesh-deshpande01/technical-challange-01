provider "azurerm" {
  features {}
}

module "MSSQL Server" {
	source = "../../../../modules/mssql_server"
  location = var.location
  type = var.type
  tenant_short = var.tenant_short
  env_short = var.env_short
  tenant = var.tenant
  env = var.env
  resource_suffix_short = var.resource_suffix_short
  account_tier = var.account_tier
  account_replication_type = var.account_replication_type
  version = var.version
  user = var.user
  password = var.password
  collation = var.collation
  license_type = var.license_type
  max_size_gb = var.max_size_gb
  read_scale = var.read_scale
  sku_name = var.sku_name
  zone_redundant = var.zone_redundant
}