dynamic_keyvault_secrets = {
  kv1 = {
    shirKey = {
      # this secret is retrieved automatically from the module run output
      secret_name   = "shir-auth-key"
      output_key    = "data_factory_integration_runtime_self_hosted"
      resource_key  = "dfirsh1"
      attribute_key = "auth_key_1"
    }
  }
}
