# main.tf
resource "azurerm_resource_group" "dev_rg" {
  name     = local.rg_name
  location = local.rg_location
}


resource "azurerm_virtual_network" "private_vnet" {
  name                = "private-dev-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.dev_rg.location
  resource_group_name = azurerm_resource_group.dev_rg.name

  tags = {
    terraform = "true"
  }
}



output "resource_group_name" {
  value = azurerm_resource_group.dev_rg.name
}

output "resource_group_location" {
  value = azurerm_resource_group.dev_rg.location
}
