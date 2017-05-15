provider "azurerm" { }

module "prometheus-monitor" {

  source = "../prometheus-modules"
  
azure_resource_group_name = "${var.azure_resource_group_name}"
vm_name_prefix    = "${var.vm_name_prefix}"
mod_app_vm_count  = "${var.app_vm_count}"
mod_mon_vm_count  = "${var.mon_vm_count}"
vm_size           = "${var.vm_size}"
azure_region      = "${var.azure_region}"
#azure_dns_suffix  = "${var.azure_dns_suffix}"
username          = "${var.username}"
domain_name_label = "${var.domain_name_label}"
environment_tag   = "${var.environment_tag}"
}

