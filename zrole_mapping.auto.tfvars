role_mapping = {
  built_in_role_mapping = {
    keyvaults = {
      kv1 = {
        "Key Vault Secrets User" = {
          logged_in = {
            keys = ["user"]
          }
          managed_identities = {
            keys = ["vmssadf"]
          }
        }
      }
      kv2 = {
        "Key Vault Secrets User" = {
          logged_in = {
            keys = ["user"]
          }
          purview_accounts = {
            keys = ["pva1"]
          }
        }
      }
    }
    storage_accounts = {
      sa1 = {
        "Storage Blob Data Reader" = {
          managed_identities = {
            keys = ["vmssadf"]
          }
        }
        "Storage Blob Data Contributor" = {
          logged_in = {
            keys = ["user"]
          }
        }
      }
    }
  }
}
