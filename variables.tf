# variable "resource_group_name" {}
# variable "location" {}

variable "resource_group_name" {
  description = "Existing resource group where storage account will be created"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

