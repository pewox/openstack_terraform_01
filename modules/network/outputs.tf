output "network_id" {
  value = openstack_networking_network_v2.network.id
}
output "sub_id" {
  value = openstack_networking_subnet_v2.subnet.id
}