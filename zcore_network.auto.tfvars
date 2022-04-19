vnets = {
  vnet_region1 = {
    resource_group_key = "networking"
    vnet = {
      name          = "esdmalz-networking"
      address_space = ["10.0.0.0/21"]
    }
    subnets = {
      services = {
        name              = "services"
        cidr              = ["10.0.0.0/24"]
        service_endpoints = ["Microsoft.KeyVault"]
      }
      aci = {
        name = "aci"
        cidr = ["10.0.1.0/25"]
        delegation = {
          name               = "acidelegation"
          service_delegation = "Microsoft.ContainerInstance/containerGroups"
          actions = [
            "Microsoft.Network/virtualNetworks/subnets/action"
          ]
        }
      }
      bastion = {
        name    = "AzureBastionSubnet"
        cidr    = ["10.0.1.128/25"]
        nsg_key = "azure_bastion_nsg"
      }
      data_product01 = {
        name = "data-product01"
        cidr = ["10.0.2.0/26"]
      }
      private_endpoints = {
        name                                           = "private-endpoints"
        cidr                                           = ["10.0.6.0/24"]
        enforce_private_link_endpoint_network_policies = true
      }
    }
    diagnostic_profiles = {
      operation = {
        definition_key   = "networking_all"
        destination_type = "log_analytics"
        destination_key  = "central_logs"
      }
    }
  }
}
