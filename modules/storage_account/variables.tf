variable "storage_account_name" {
  type        = string
  description = "The name of the storage account (must be globally unique, lowercase, 3–24 chars)."
}

variable "resource_group_name" {
  type        = string
  description = "Resource group where the storage account will be created."
}

variable "location" {
  type        = string
  description = "Azure location."
}

variable "containers" {
  type        = list(string)
  description = "List of container names to create in the storage account."
}
