resource "azurerm_virtual_machine" "spoke_vm" {
  name                  = "dev-spoke-vm"
  location              = azurerm_resource_group.dev_rg.location
  resource_group_name   = azurerm_resource_group.dev_rg.name
  network_interface_ids = [azurerm_network_interface.spoke_vm_nic.id]
  vm_size               = "Standard_B1ls"  # Basic, cost-effective VM size
  delete_data_disks_on_termination = true
  delete_os_disk_on_termination = true

  # VM Storage
  storage_os_disk {
    name              = "example-os-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
    disk_size_gb      = 30  # Minimum disk size to reduce cost
    
  }

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  os_profile {
    computer_name  = "dev-spoke-vm"
    admin_username = "adminuser"
    admin_password = "P@ssw0rd1234!"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }

  tags = {
    terraform = "true"
  }
}



