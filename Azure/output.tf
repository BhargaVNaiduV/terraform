# Output VM Name
output "vm_name" {
  value = azurerm_virtual_machine.spoke_vm.name
  description = "The name of the Virtual Machine"
}

# Output Public IP Address
output "vm_ip_address" {
  value = azurerm_network_interface.spoke_vm_nic.private_ip_address  # Change this to public IP if you have one
  description = "The IP address of the Virtual Machine"
}

# Output Admin Username
output "vm_admin_username" {
  value = azurerm_virtual_machine.spoke_vm.os_profile
  description = "The admin username for the Virtual Machine"
  sensitive = true
}
