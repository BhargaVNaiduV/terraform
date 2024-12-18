variable "subscription_id" {
  description = "The subscription ID to use for this Azure provider"
  type        = string
  default = "78b15149-19a9-43b3-b6a6-3b42fa415c82"
}
variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default     = "dev-openai-rg"
}

variable "resource_group_location" {
  description = "The location of the resource group"
  type        = string
  default     = "East US"
}
# all this is used for bootstarp
locals {
  rg_name = "wordpress_on_azure"
  rg_location = var.resource_group_location
}

resource "azurerm_resource_group" "dev_rg" {
  name     = local.rg_name
  location = local.rg_location
}