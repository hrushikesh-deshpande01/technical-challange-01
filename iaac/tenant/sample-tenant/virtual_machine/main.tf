provider "azurerm" {
  features {}
}

module "Virtual Machine" {
	source = "../../../../modules/virtual_machines"
    rg_name = var.rg_name
    location = var.location
    type = var.type
    tenant_short = var.tenant_short
    env_short = var.env_short 
    tenant  = var.tenant 
    env = var.env 
    resource_suffix_short = var.resource_suffix_short 
    vnet_name = var.vnet_name 
    address_space = var.address_space 
    subnet_name = var.subnet_name 
    address_prefix = var.address_prefix 
    public_ip_name = var.public_ip_name 
    pip_allocation_method = var.pip_allocation_method 
    sku = var.sku 
    nic_name = var.nic_name 
    ip_config_name = var.ip_config_name  
    private_ip_address_allocation = var.private_ip_address_allocation 
    vm_size = var.vm_size 
    vm_user = var.vm_user 
    vm_pwd = var.vm_pwd 
    vm_image_publisher = var.vm_image_publisher 
    vm_image_offer = var.vm_image_offer 
    vm_image_sku = var.vm_image_sku 
    vm_image_version = var.vm_image_version 
    storage_account_type = var.storage_account_type 

}