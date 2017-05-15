data "azurerm_client_config" "current-account" {}

output "account_id" {
  value = "${data.azurerm_client_config.current-account.account_id}"
}

output "prmoetheus_vm_dns_name" {
  value = "${module.prometheus-monitor.prmoetheus_vm_dns_name}"
}
output "prmoetheus_vm_public_ip" {
  value = "${module.prometheus-monitor.prmoetheus_vm_public_ip}"
}
output "prmoetheus_vm_private_ip" {
  value = "${module.prometheus-monitor.prmoetheus_vm_private_ip}"
}
output "app_vm_private_ip" {
  value = "${module.prometheus-monitor.app_vm_private_ip}"
}
output "prom-ssh-username" {
  value = "${module.prometheus-monitor.prom-ssh-username}"
}
output "prom-ssh-password" {
  value = "${module.prometheus-monitor.prom-ssh-password}"
}
output "app-ssh-username" {
  value = "${module.prometheus-monitor.app-ssh-username}"
}
output "app-ssh-password" {
  value = "${module.prometheus-monitor.app-ssh-password}"
}
