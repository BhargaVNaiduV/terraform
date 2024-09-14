# variables.tf

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
