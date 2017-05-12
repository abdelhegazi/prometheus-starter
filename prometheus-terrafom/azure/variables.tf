variable "azure_resource_group_name" {
    description = "Resource Group Name"
    default = "rmgmond_RG"
}

variable "vm_name_prefix" { 
	description = "The Virtual Machine Name"
    default = "rmgmond_VM"
}

variable "vm_count" {
    description = "Number of VMs to create"
    default = "2"
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

# TODO: create a resource that generates random password for each servers
variable "admin_password" {
    description = "Password for the Administrator account"
    default = "Ops#!rMg123"
}


variable "environment_tag" {
    description = "Tag to apply to the resoucrces"
    default = "RMG Monitoring Dev"
}