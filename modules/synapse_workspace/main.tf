resource "azurerm_synapse_workspace" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location

  # Correct format for default data lake
  storage_data_lake_gen2_filesystem_id = "https://${var.storage_account_name}.dfs.core.windows.net/${var.file_system}"

  sql_administrator_login          = "synapseadmin"
  sql_administrator_login_password = random_password.synapse_admin.result

  identity {
    type = "SystemAssigned"
  }

  tags = {
    environment = "dev"
    workload    = "data-platform"
  }
}

resource "random_password" "synapse_admin" {
  length  = 16
  special = true
}

resource "azurerm_role_assignment" "synapse_storage_contrib" {
  scope                = var.storage_account_id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = azurerm_synapse_workspace.this.identity[0].principal_id
}
