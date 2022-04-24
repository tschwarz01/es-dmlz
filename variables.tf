variable "global_settings" {
  default = {
    default_region = "region1"
    regions = {
      region1 = "southcentralus"
      region2 = "centralus"
    }
  }
}

variable "landingzone" {
  default = {
    backend_type        = "azurerm"
    global_settings_key = "launchpad"
    level               = "level0"
    key                 = "examples"
  }
}
variable "current_landingzone_key" {
  default = "examples"
}
variable "resource_groups" {
  default = {}
}
variable "vnets" {
  default = {}
}
variable "virtual_subnets" {
  default = {}
}
variable "diagnostic_log_analytics" {
  default = {}
}
variable "diagnostics_destinations" {
  default = {}
}
variable "diagnostics_definition" {
  default = {}
}
variable "public_ip_addresses" {
  default = {}
}
variable "bastion_hosts" {
  default = {}
}
variable "azure_container_registries" {
  default = {}
}
variable "network_security_group_definition" {
  default = {}
}
variable "shared_image_galleries" {
  default = {}
}
variable "purview_accounts" {
  default = {}
}
variable "role_mapping" {
  default = {}
}
variable "keyvaults" {
  default = {}
}
variable "managed_identities" {
  default = {}
}
variable "private_dns" {
  default = {}
}
variable "data_factory" {
  default = {}
}
variable "data_factory_integration_runtime_self_hosted" {
  default = {}
}
variable "virtual_machine_scale_sets" {
  default = {}
}
variable "diagnostic_storage_accounts" {
  default = {}
}
variable "dynamic_keyvault_secrets" {
  default = {}
}
variable "storage_accounts" {
  default = {}
}
variable "storage_account_blobs" {
  default = {}
}
variable "storage_containers" {
  default = {}
}
variable "load_balancers" {
  default = {}
}
variable "application_security_groups" {
  default = {}
}
variable "keyvault_access_policies" {
  default = {}
}
variable "vnet_peerings" {
  default = {}
}
