data "azurerm_client_config" "default" {}

module "caf" {
  source = "./modules/terraform-azurerm-caf"
  providers = {
    azurerm.vhub = azurerm.vhub
  }
  current_landingzone_key = var.landingzone.key
  global_settings         = var.global_settings
  resource_groups         = var.resource_groups
  keyvaults               = var.keyvaults
  managed_identities      = var.managed_identities
  role_mapping            = var.role_mapping
  storage_accounts        = var.storage_accounts

  /*
  diagnostics = {
    diagnostic_log_analytics    = var.diagnostic_log_analytics
    diagnostics_destinations    = var.diagnostics_destinations
    diagnostics_definition      = var.diagnostics_definition
    diagnostic_storage_accounts = var.diagnostic_storage_accounts
  }
  */
  networking = {
    public_ip_addresses               = var.public_ip_addresses
    network_security_group_definition = var.network_security_group_definition
    vnets                             = var.vnets
    private_dns                       = var.private_dns
  }
  compute = {
    bastion_hosts = var.bastion_hosts
    #azure_container_registries = var.azure_container_registries
    virtual_machine_scale_sets = var.virtual_machine_scale_sets
  }
  shared_services = {
    #shared_image_galleries = var.shared_image_galleries
  }
  data_factory = {
    data_factory                                 = var.data_factory
    data_factory_integration_runtime_self_hosted = var.data_factory_integration_runtime_self_hosted
  }
  purview = {
    #purview_accounts = var.purview_accounts
  }

  storage = {
    storage_account_blobs = var.storage_account_blobs
    storage_containers    = var.storage_containers
  }


  #security = {
  #  dynamic_keyvault_secrets = var.dynamic_keyvault_secrets
  #}
  # Add object as described below
}


module "dynamic_keyvault_secrets" {
  source = "./modules/terraform-azurerm-caf/modules/security/dynamic_keyvault_secrets"
  # version = "~>5.3.2"
  #source = "../modules/security/dynamic_keyvault_secrets"
  # source = "git::https://github.com/aztfmod/terraform-azurerm-caf.git//modules/security/dynamic_keyvault_secrets?ref=master"
  for_each = {
    for keyvault_key, secrets in try(var.dynamic_keyvault_secrets, {}) : keyvault_key => {
      for key, value in secrets : key => value
      if try(value.value, null) == null
    }
  }
  settings = each.value
  keyvault = module.caf.keyvaults[each.key]
  objects  = module.caf
}


locals {
  vaults = tomap({ (var.landingzone.key) = module.caf.keyvaults })
  #shirKey   = module.caf.data_factory_integration_runtime_self_hosted["dfirsh1"].auth_key_1
  #pSettings = "powershell.exe -ExecutionPolicy Unrestricted -File installSHIRGateway.ps1 -gatewayKey ${shirKey}"
}

module "vmss_extension_custom_script_adf_shir" {
  source     = "./modules/terraform-azurerm-caf/modules/compute/virtual_machine_scale_set_extensions"
  depends_on = [module.dynamic_keyvault_secrets]

  for_each = {
    for key, value in try(var.virtual_machine_scale_sets, {}) : key => value
    if try(value.virtual_machine_scale_set_extensions.data_factory_self_hosted_integration_runtime, null) != null
  }

  client_config                     = module.caf.client_config
  virtual_machine_scale_set_id      = module.caf.virtual_machine_scale_sets[each.key].id
  extension                         = each.value.virtual_machine_scale_set_extensions.data_factory_self_hosted_integration_runtime
  extension_name                    = "data_factory_self_hosted_integration_runtime"
  managed_identities                = tomap({ (var.landingzone.key) = module.caf.managed_identities })
  storage_accounts                  = tomap({ (var.landingzone.key) = module.caf.storage_accounts })
  virtual_machine_scale_set_os_type = module.caf.virtual_machine_scale_sets[each.key].os_type
  keyvaults                         = tomap({ (var.landingzone.key) = module.caf.keyvaults })
  keyvault_id                       = local.vaults[var.landingzone.key]["kv1"].id
}