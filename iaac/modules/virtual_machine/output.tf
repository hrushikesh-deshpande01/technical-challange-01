output "vm_name" {
	value = azurerm_windows_virtual_machine.this.*.name
}
output "vm_private_ip_address" {
	value = azurerm_network_interface.this.*.private_ip_address
}
output "vm_public_ip_address" {
	value = azurerm_network_interface.this.*.public_ip_address
}