
# Application security groups
application_security_groups = {
  app_sg1 = {
    resource_group_key = "integration"
    name               = "app_sg1"

  }
}

# Load Balancer
# Public Load Balancer will be created. For Internal/Private Load Balancer config, please refer 102-internal-load-balancer example.

load_balancers = {
  lb-vmss = {
    name                      = "lb-vmss"
    sku                       = "basic"
    resource_group_key        = "integration"
    backend_address_pool_name = "vmss1"
    frontend_ip_configurations = {
      config1 = {
        name                  = "config1"
        public_ip_address_key = "lb_pip1"
      }
    }
    probes = {
      probe1 = {
        resource_group_key = "integration"
        load_balancer_key  = "lb-vmss"
        probe_name         = "rdp"
        port               = "3389"
      }
    }
    lb_rules = {
      rule1 = {
        resource_group_key             = "integration"
        load_balancer_key              = "lb-vmss"
        lb_rule_name                   = "rule1"
        protocol                       = "tcp"
        probe_id_key                   = "probe1"
        frontend_port                  = "3389"
        backend_port                   = "3389"
        frontend_ip_configuration_name = "config1" #name must match the configuration that's defined in the load_balancers block.
      }
    }
  }
}
