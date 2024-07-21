variable "net_name" {
  type = string
}
variable "subnet_name" {
  type = string
}
variable "subnet_cidr" {
  type = string
}
variable "secgrp_name" {
  type = string
}
variable "secgrp_rules" {
  type = list(any)
}
