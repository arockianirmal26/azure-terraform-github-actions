resource "azurerm_synapse_spark_pool" "this" {
  name                 = var.name
  synapse_workspace_id = "/subscriptions/${data.azurerm_client_config.current.subscription_id}/resourceGroups/${var.resource_group_name}/providers/Microsoft.Synapse/workspaces/${var.workspace_name}"

  node_size_family = var.node_size_family # "MemoryOptimized"
  node_size        = var.node_size        # "Small"
  node_count       = 3

  # node_count = var.node_count # used only when auto_scale=false

  auto_pause {
    delay_in_minutes = 15
  }


  cache_size = 100 # Default cache size in GB per node, can be parameterized

  spark_version = "3.4" # Current supported version (can be updated)

  tags = {
    environment = "dev"
    workload    = "data-platform"
  }
}

data "azurerm_client_config" "current" {}
