output "cirros" {
  value     = module.vms.cirros
  sensitive = true
}
output "rules" {
  value = { for name, wert in var.secgrp_rules : name => wert }
}


