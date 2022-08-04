provider "azurerm" {
  features {}
}

locals {
    rg_name ="rg_${var.tenant_short}_${var.env_short}_${var.resource_suffix_short}"
    azurerm_service_plan = "svcplan_${var.tenant_short}_${var.env_short}_${var.resource_suffix_short}"
    azurerm_linux_web_app ="webapp-${var.tenant_short}_${var.env_short}_${var.resource_suffix_short}"
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

resource "azurerm_service_plan" "this" {
  name                = "${local.azurerm_service_plan_name}"
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  os_type             = "${var.os_type}"
  sku_name            = "${var.sku_name}"
}

resource "azurerm_linux_web_app" "this" {
  name                = "${local.azurerm_linux_web_app_name}"
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_service_plan.this.location
  service_plan_id     = azurerm_service_plan.this.id

  site_config {}
}