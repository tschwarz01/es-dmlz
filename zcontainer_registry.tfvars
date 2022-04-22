azure_container_registries = {
  acr1 = {
    name               = "acr-test"
    resource_group_key = "acr_region1"
    sku                = "Premium"
    admin_enabled      = true
    private_endpoints = {
      registry = {
        name               = "acr-private-link"
        resource_group_key = "vnet_region1"
        vnet_key           = "consumption"
        subnet_key         = "private_endpoints"
        private_service_connection = {
          name                 = "acr-private-link"
          is_manual_connection = false
          subresource_names    = ["registry"]
        }
      }
    }
    diagnostic_profiles = {
      central_logs_region1 = {
        definition_key   = "azure_container_registry"
        destination_type = "log_analytics"
        destination_key  = "central_logs"
      }
    }
  }
}
