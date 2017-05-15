variable "azure_resource_group_name" {
    description = "Resource Group Name"
    default = "rmgmondRG"
}

variable "vm_name_prefix" { 
	description = "The Virtual Machine Name"
    default = "rmgmond_VM"
}

variable "app_vm_count" {
    description = "Number of application VMs to create"
    default = "1"
}

variable "mon_vm_count" {
    description = "Number of Prometheus server VMs to create"
    default = "1"
}

variable "vm_size" { 
	description = "Azure VM Size"
    default = "Standard_A1"
}

variable "azure_region" {
    description = "Rrimary Azure region for all resources"
    default = "ukwest"
}

#variable "azure_dns_suffix" {
#    description = "Azure DNS suffix for the Public IP"
#    default = "cloudapp.azure.com"
#}

variable "username" {
    description = "sudoer Username"
    default = "rmg-user"
}

variable "domain_name_label" {
    description = "domain name label for the public IP"
    default = "rmgmond-prom"
}

variable "environment_tag" {
    description = "Tag to apply to the resoucrces"
    default = "RMG Monitoring Dev"
}
