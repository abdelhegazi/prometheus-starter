#
#data "azurerm_client_config" "current-account" {}
#
#output "account_id" {
#  value = "${data.azurerm_client_config.current-account.account_id}"
#}

output "prmoetheus_vm_dns_name" {
  value = "${azurerm_public_ip.rmgmond-pubip.fqdn}"
}

# publicIP address
output "prmoetheus_vm_public_ip" {
  value = "${azurerm_public_ip.rmgmond-pubip.ip_address}"
}

output "prmoetheus_vm_private_ip" {
  value = "${azurerm_network_interface.promond-nic.private_ip_address}"
}

output "app_vm_private_ip" {
  value = "${azurerm_network_interface.vm-app-nic.private_ip_address}"
}

output "prom-ssh-username" {
  value = "${var.username}"
}

output "prom-ssh-password" {
  value = "${random_id.prom-user-password.b64}"
}

output "app-ssh-username" {
  value = "${var.username}"
}

output "app-ssh-password" {
  value = "${random_id.app-user-password.b64}"
}
