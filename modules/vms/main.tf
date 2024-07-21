resource "openstack_compute_instance_v2" "cirros-server" {
  count = var.vm_count
  name = "${var.vm_name}${format("%03d", count.index + 1)}"
  flavor_name = var.flavor_name
  image_name  = var.image_name
  security_groups = var.secgrp

  network {
    port = openstack_networking_port_v2.port[count.index].id
  }
}

resource "openstack_networking_port_v2" "port" {
  count = var.vm_count
  name = "port${format("%03d" ,count.index + 1)}"
  network_id     = var.net_id
  admin_state_up = "true"
  
  fixed_ip {
    subnet_id = var.fixed_ip
  }
}