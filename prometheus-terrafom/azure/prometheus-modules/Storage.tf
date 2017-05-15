# Create Storage account
resource "azurerm_storage_account" "storage1" {
  name                ="rmgmondstraccount"
  #name                = "${format("%s-stracc", azurerm_resource_group.rmgmondRG.name)}"
  resource_group_name = "${azurerm_resource_group.rmgmondRG.name}"
  location            = "${var.azure_region}"
  account_type        = "Standard_LRS"

  tags {
    env    = "${var.environment_tag}"
  }
}

# Create Storage Container
resource "azurerm_storage_container" "container" {
  name                  = "vhds"
  resource_group_name   = "${azurerm_resource_group.rmgmondRG.name}"
  storage_account_name  = "${azurerm_storage_account.storage1.name}"
  container_access_type = "private"
}
