resource "azurerm_virtual_network" "private_vnet" {
  name                = "private-dev-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.dev_rg.location
  resource_group_name = azurerm_resource_group.dev_rg.name

  tags = {
    terraform = "true"
  }
}

resource "azurerm_subnet" "spoke_subnet" {
  name                 = "example-subnet"
  resource_group_name  = azurerm_resource_group.dev_rg.name
  virtual_network_name = azurerm_virtual_network.private_vnet.name
  address_prefixes     = ["10.0.1.0/24"]

}

resource "azurerm_network_interface" "spoke_vm_nic" {
  name                = "example-nic"
  location            = azurerm_resource_group.dev_rg.location
  resource_group_name = azurerm_resource_group.dev_rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.spoke_subnet.id
    private_ip_address_allocation = "Dynamic"
  }

  tags = {
    terraform = "true"
  }
}