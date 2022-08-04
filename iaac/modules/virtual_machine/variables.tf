variable "rg_name" {}
variable "location" {}
variable "type" {}
variable "tenant_short" {}
variable "env_short" {}
variable "tenant" {}
variable "env" {}
variable "resource_suffix_short" {}
variable "vnet_name" {}
variable "address_space" {
	default = "10.0.0.0/16"
}
variable "subnet_name" {}
variable "address_prefix" {
	default = "10.0.1.0/24"
}
variable "public_ip_name" {}
variable "pip_allocation_method" {
	default = "Dynamic"
}
variable "sku" {
	default = "Basic"
}
variable "nic_name" {}
variable "ip_config_name" {}
variable "private_ip_address_allocation" {
	default = "Dynamic"
}
variable "vm_size" {
	default = "Standard_B1s"
}
variable "vm_user" {}
variable "vm_pwd" {}
variable "vm_image_publisher" {
	default = "MicrosoftWindowsServer"
}
variable "vm_image_offer" {
	default = "WindowsServer"
}
variable "vm_image_sku" {
	default = "2019-Datacenter"
}
variable "vm_image_version" {
	default = "latest"
}
variable "storage_account_type" {
	default = "Standard_LRS"
}
