
vnet_peerings = {
  mgmg_lz_to_connectivity_hub = {
    name = "mgmt_lz_to_connectivity_hub"
    from = {
      vnet_key = "vnet_region1"
    }
    to = {
      remote_virtual_network_id = "/subscriptions/893395a4-65a3-4525-99ea-2378c6e0dbed/resourceGroups/rg-network_connectivity_hub/providers/Microsoft.Network/virtualNetworks/vnet-connectivity_hub"
    }
    allow_virtual_network_access = true
    allow_forwarded_traffic      = true
    allow_gateway_transit        = false
    use_remote_gateways          = true
  }
}
/*
  mgmt_lz_to_data_lz1 = {
    name = "mgmt_lz_to_data_lz1"
    from = {
      vnet_key = "vnet_region1"
    }
    to = {
      #vnet_key = "hub_re1"
      remote_virtual_network_id = ""
    }
    allow_virtual_network_access = true
    allow_forwarded_traffic      = true
    allow_gateway_transit        = false
    use_remote_gateways          = true
  }

}
*/
