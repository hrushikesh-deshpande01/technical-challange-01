provider "azurerm" {
  features {}
}

module "Web App" {
	source = "../../../../modules/web_app"
  location = var.location
  type = var.type
  tenant_short = var.tenant_short
  env_short = var.env_short
  tenant = var.tenant
  env = var.env
  resource_suffix_short = var.resource_suffix_short
  os_type =  var.os_type
  sku_name = var.os_type
}