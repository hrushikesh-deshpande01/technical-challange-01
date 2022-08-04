variable "location" {}
variable "type" {}
variable "tenant_short" {}
variable "env_short" {}
variable "tenant" {}
variable "env" {}
variable "resource_suffix_short" {}
variable "account_tier" {
	default = "Standard"
}
variable "account_replication_type" {
	default = "LRS"
}
variable "version" {
	default = "12.0"
}
variable "user" {}
variable "password" {}
variable "collation" {
	default = "SQL_Latin1_General_CP1_CI_AS"
}
variable "license_type" {
	default = "LicenseIncluded"
}
variable "max_size_gb" {
	default = "4"
}
variable "read_scale" {
	default = "true"
}
variable "sku_name" {
	default = "S0"
}
variable "zone_redundant" {
	default = "true"
}