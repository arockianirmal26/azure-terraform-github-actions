resource "azurerm_storage_account" "this" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  # Enable Hierarchical Namespace for ADLS Gen2
  is_hns_enabled           = true

  min_tls_version          = "TLS1_2"

  tags = {
    environment = "dev"
    workload    = "data-platform"
  }
}

resource "azurerm_storage_container" "this" {
  for_each              = toset(var.containers)
  name                  = each.key
  storage_account_name  = azurerm_storage_account.this.name
  container_access_type = "private"
}
