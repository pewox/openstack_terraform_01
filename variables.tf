variable "net_name" {
  type    = string
  default = "Network01"
}
variable "subnet_name" {
  type    = string
  default = "Subnet1"
}
variable "subnet_cidr" {
  type    = string
  default = "192.168.100.0/24"
}
variable "secgrp_name" {
  type    = string
  default = "Secure_Group1"
}
variable "secgrp_rules" {
  type    = map(any)
  default = {direction = "ingress", ethertype = "IPv4", ip_prefix = "0.0.0.0/0"}
}
output "rules" {
  value = {for name, wert in var.secgrp_rules : name  => wert}
}
variable "vm_name" {
  type    = string
  default = "cirros"
}
variable "flavor_name" {
  type    = string
  default = "cirros256"
}
variable "image_name" {
  type    = string
  default = "cirros"
}
variable "secgrp" {
  type    = list(any)
  default = ["default", ]
}
variable "network" {
  type    = string
  default = "public"
}
variable "vm_count" {
  type    = number
  default = 2
}
variable "port_name" {
  type    = string
  default = "test-port"
}