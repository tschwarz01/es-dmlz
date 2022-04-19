bastion_hosts = {
  bastion_hub = {
    name               = "bastion-001"
    region             = "region1"
    resource_group_key = "shared-services"
    vnet_key           = "vnet_region1"
    subnet_key         = "bastion"
    public_ip_key      = "bastion_host"

    # you can setup up to 5 profiles
    diagnostic_profiles = {
      operations = {
        definition_key   = "bastion_host"
        destination_type = "log_analytics"
        destination_key  = "central_logs"
      }
    }
  }
}

public_ip_addresses = {
  bastion_host = {
    name                    = "bastion-pip1"
    resource_group_key      = "shared-services"
    sku                     = "Standard"
    allocation_method       = "Static"
    ip_version              = "IPv4"
    idle_timeout_in_minutes = "4"
  }
}

