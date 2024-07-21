module "network" {
  source      = "./modules/network"
  net_name    = var.net_name
  subnet_name = var.subnet_name
  subnet_cidr = var.subnet_cidr
  secgrp_name = var.secgrp_name
  secgrp_rules = var.secgrp_rules
}

module "vms" {
  source      = "./modules/vms"
  vm_name     = var.vm_name
  flavor_name = var.flavor_name
  image_name  = var.image_name
  secgrp      = var.secgrp
  network     = var.network
  vm_count    = var.vm_count
  net_id      = module.network.network_id
}