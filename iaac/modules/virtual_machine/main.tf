provider   "azurerm"   { 
   version   =   "= 2.0.0" 
   features   {} 
 } 

locals {
    vmname = "vm_${var.tenant_short}_${var.env_short}_${var.resource_suffix_short}"
    rg_name ="rg_${var.tenant_short}_${var.env_short}_${var.resource_suffix_short}"
}

 resource   "azurerm_resource_group"   "this"   { 
   name   =   "${local.rg_name}" 
   location   =   "${var.location}" 
   tags = {
    type = "${var.type}"
    tenant = "${var.tenant}"
    env = "${var.env}"
  }
 } 

 resource   "azurerm_virtual_network"   "this"   { 
   name   =   "${var.vnet_name}" 
   address_space   =   [ "${var.address_space}" ] 
   location   =   "${var.location}" 
   resource_group_name   =   azurerm_resource_group.this.name 
 } 

 resource   "azurerm_subnet"   "this"   { 
   name   =   "${var.subnet_name}" 
   resource_group_name   =    azurerm_resource_group.this.name 
   virtual_network_name   =   azurerm_virtual_network.this.name 
   address_prefix   =   "${var.address_prefix}" 
 } 

 resource   "azurerm_public_ip"   "this"   { 
   name   =   "${var.public_ip_name}" 
   location   =   "${var.location}"
   resource_group_name   =   azurerm_resource_group.this.name 
   allocation_method   =   "${var.pip_allocation_method}" 
   sku   =   "${var.sku}" 
 } 

 resource   "azurerm_network_interface"   "this"   { 
   name   =   "${var.nic_name}" 
   location   =   "${var.location}" 
   resource_group_name   =   azurerm_resource_group.this.name 

   ip_configuration   { 
     name   =   "${var.ip_config_name}" 
     subnet_id   =   azurerm_subnet.this.id 
     private_ip_address_allocation   =   "${var.private_ip_address_allocation}" 
     public_ip_address_id   =   azurerm_public_ip.this.id 
   } 
 } 

 resource   "azurerm_windows_virtual_machine"   "this"   { 
   name                    =   "${local.vmname}"   
   location                =   "${var.location}"
   resource_group_name     =   azurerm_resource_group.this.name 
   network_interface_ids   =   [ azurerm_network_interface.this.id ] 
   size                    =   "${var.vm_size}"
   admin_username          =   "${var.vm_user}"
   admin_password          =   "${var.vm_pwd}" 

   source_image_reference   { 
     publisher   =   "${var.vm_image_publisher}"
     offer       =   "${var.vm_image_offer}"
     sku         =   "${var.vm_image_sku}"
     version     =   "${var.vm_image_version}" 
   } 

   os_disk   { 
     caching             =   "ReadWrite" 
     storage_account_type   =   "${var.storage_account_type}" 
   } 
 }