terraform {
  required_version = ">= 0.14.0"
  required_providers {
    openstack = {
      source = "terraform-provider-openstack/openstack"
      #version = "~> 1.53.0"
    }
  }
}

provider "openstack" {
  user_name        = "admin"
  tenant_name      = "admin"
  password         = "Sum+201Ale00"
  auth_url         = "http://192.168.178.11/identity/v3"
  region           = "RegionOne"
  user_domain_name = "default"
}