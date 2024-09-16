# main.tf
resource "azurerm_resource_group" "dev_rg" {
  name     = local.rg_name
  location = local.rg_location
}





output "resource_group_name" {
  value = azurerm_resource_group.dev_rg.name
}

output "resource_group_location" {
  value = azurerm_resource_group.dev_rg.location
}
