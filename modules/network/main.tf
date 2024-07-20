
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

resource "openstack_networking_secgroup_rule_v2" "secgrp_rule" {
  direction         = "ingress"
  ethertype         = "IPv4"
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.secgrp.id
}