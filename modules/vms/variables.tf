variable "vm_name" {
  type =  string
}

variable "secgrp" {
  type = list(any)
}

variable "network" {
  type = string
}

variable "flavor_name" {
  type = string
}

variable "image_name" {
  type = string
}
variable "vm_count" {
  type = number
}

variable "net_id" {
  type = string
}
variable "fixed_ip" {
  type = string
}