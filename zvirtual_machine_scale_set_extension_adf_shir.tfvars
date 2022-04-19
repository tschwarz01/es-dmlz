/*
virtual_machine_scale_set_extensions = {
  data_factory_self_hosted_integration_runtime = {
    self_hosted_integration_runtime_auth_key = null
    vault_settings = {
      secret_name  = "shir-auth-key"
      key_vault_id = null
      lz_key       = null
      keyvault_key = "kv1"
    }
    # You can define fileuris directly or use fileuri_sa reference keys and lz_key:
    fileuris = ["https://raw.githubusercontent.com/Azure/data-landing-zone/main/code/installSHIRGateway.ps1"]
    #fileuri_sa_key            = "sa1"
    #fileuri_sa_path           = "files/helloworld.ps1"
    commandtoexecute = "powershell.exe -ExecutionPolicy Unrestricted -File installSHIRGateway.ps1 -gatewayKey"
    identity_type    = "UserAssigned" # optional to use managed_identity for download from location specified in fileuri, UserAssigned or SystemAssigned.
    #lz_key                    = "examples"
    managed_identity_key      = "vmssadf"
    automatic_upgrade_enabled = false
    # managed_identity_id       = "id" # optional to define managed identity principal_id directly
    # lz_key                    = "other_lz" # optional for managed identity defined in other lz
  }
}
*/
