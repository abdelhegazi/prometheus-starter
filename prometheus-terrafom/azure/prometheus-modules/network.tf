# Create a virtual network in the rmgmond resource group
resource "azurerm_virtual_network" "mond_network" {
  name                = "${var.azure_resource_group_name}-VNet"
  address_space       = ["10.0.0.0/16"]
  location            = "${var.azure_region}"
  resource_group_name = "${azurerm_resource_group.rmgmondRG.name}"
}

# Public subnet
# initially will add the two servers here, but later on will move the application 
# server to the private subnet
resource "azurerm_subnet" "pubsubnet1" {
  name                 = "${var.azure_resource_group_name}-Pubsubnet1"
  resource_group_name  = "${azurerm_resource_group.rmgmondRG.name}"
  virtual_network_name = "${azurerm_virtual_network.mond_network.name}"
  address_prefix       = "10.0.1.0/24"
}

# Private subnet Application server shall live here
resource "azurerm_subnet" "privsubnet1" {
  name                 = "${var.azure_resource_group_name}-Privubnet1"
  resource_group_name  = "${azurerm_resource_group.rmgmondRG.name}"
  virtual_network_name = "${azurerm_virtual_network.mond_network.name}"
  address_prefix       = "10.0.100.0/24"
}




