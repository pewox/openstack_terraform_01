
resource "openstack_networking_network_v2" "network" {
  name           = var.net_name
  admin_state_up = "true"
}

resource "openstack_networking_subnet_v2" "subnet" {
  name       = var.subnet_name
  network_id = openstack_networking_network_v2.network.id
  cidr       = var.subnet_cidr
  ip_version = 4
}

resource "openstack_networking_secgroup_v2" "secgrp" {
  name        = var.secgrp_name
  description = "Sec-Group1"
}
/*
resource "openstack_networking_secgroup_rule_v2" "secgrp_rule" {
  direction         = var.secgrp_rules.direction
  ethertype         = var.secgrp_rules.ethertype
  remote_ip_prefix  = var.secgrp_rules.ip_prefix
  security_group_id = openstack_networking_secgroup_v2.secgrp.id
}
*/
resource "openstack_networking_secgroup_rule_v2" "rules" {
  for_each = {
    for rule in var.secgrp_rules : rule["direction"] => rule
  }
  direction         = each.value.direction
  ethertype         = each.value.ethertype
  remote_ip_prefix  = each.value.ip_prefix
  port_range_max    = each.value.port
  port_range_min    = each.value.port
  protocol          = each.value.protocol
  security_group_id = openstack_networking_secgroup_v2.secgrp.id
}
