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
