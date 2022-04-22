keyvaults = {
  kv1 = {
    name               = "integration"
    resource_group_key = "integration"
    sku_name           = "standard"
    #enable_rbac_authorization = true
    soft_delete_enabled      = true
    purge_protection_enabled = true
    creation_policies = {
      logged_in_user = {
        certificate_permissions = ["Get", "List", "Update", "Create", "Import", "Delete", "Purge", "Recover", "Getissuers", "Setissuers", "Listissuers", "Deleteissuers", "Manageissuers", "Restore", "Managecontacts"]
        secret_permissions      = ["Set", "Get", "List", "Delete", "Purge", "Recover"]
      }
    }
    diagnostic_profiles = {
      central_logs_region1 = {
        definition_key   = "azure_key_vault"
        destination_type = "log_analytics"
        destination_key  = "central_logs"
      }
    }
    private_endpoints = {
      vault = {
        name               = "vault"
        resource_group_key = "integration"
        vnet_key           = "vnet_region1"
        subnet_key         = "private_endpoints"
        private_service_connection = {
          name                 = "vault"
          is_manual_connection = false
          subresource_names    = ["vault"]
        }
        private_dns = {
          zone_group_name = "default"
          keys            = ["privatelink.vaultcore.azure.net"]
        }
      }
    }
  }
  kv2 = {
    name                      = "kv-governance"
    resource_group_key        = "governance"
    sku_name                  = "standard"
    enable_rbac_authorization = true
    soft_delete_enabled       = true
    purge_protection_enabled  = true
    network = {
      default_action = "Deny"
      bypass         = "AzureServices"
      ip_rules       = []
      subnets = {
        servicesSubnetName = {
          vnet_key   = "vnet_region1"
          subnet_key = "services"
        }
      }
    }
    diagnostic_profiles = {
      central_logs_region1 = {
        definition_key   = "azure_key_vault"
        destination_type = "log_analytics"
        destination_key  = "central_logs"
      }
    }
    private_endpoints = {
      vault = {
        name               = "vault"
        resource_group_key = "governance"
        vnet_key           = "vnet_region1"
        subnet_key         = "private_endpoints"
        private_service_connection = {
          name                 = "vault"
          is_manual_connection = false
          subresource_names    = ["vault"]
        }
        private_dns = {
          zone_group_name = "default"
          keys            = ["privatelink.vaultcore.azure.net"]
        }
      }
    }
  }
}
