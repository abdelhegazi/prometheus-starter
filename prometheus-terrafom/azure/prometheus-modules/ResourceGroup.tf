resource "azurerm_resource_group" "rmgmondRG" {
  name     = "${var.azure_resource_group_name}"
  location = "${var.azure_region}"

  tags {
    environment = "${var.environment_tag}"
  }
}
