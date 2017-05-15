# Create Network Interface
resource "azurerm_network_interface" "vm-app-nic" {
  count               = "${var.mod_app_vm_count}"
  name                = "${azurerm_resource_group.rmgmondRG.name}-appnic-${count.index}"
  location            = "${var.azure_region}"
  resource_group_name = "${azurerm_resource_group.rmgmondRG.name}"
  dns_servers         = ["8.8.8.8", "8.8.4.4"]

  ip_configuration {
    name                          = "${azurerm_resource_group.rmgmondRG.name}-appnic-${count.index}"
    subnet_id                     = "${azurerm_subnet.privsubnet1.id}"
    private_ip_address_allocation = "dynamic"
  }
  tags {
    env    = "${var.environment_tag}"
  }
}

# Create Application Virtual Machine(s)
resource "azurerm_virtual_machine" "vm-app" {
  name                  = "rmgmond-app-${count.index}"
  location              = "${var.azure_region}"
  count                 = "${var.mod_app_vm_count}"
  vm_size               = "${var.vm_size}"
  depends_on            = ["azurerm_virtual_network.mond_network"]
  resource_group_name   = "${azurerm_resource_group.rmgmondRG.name}"
  #network_interface_ids = ["${element(azurerm_network_interface.vm-app-nic.*.id, count.index)}"]
  network_interface_ids = ["${azurerm_network_interface.vm-app-nic.id}"]
  # availability_set_id = "${azurerm_availability_set.availability_set.id}"
  delete_os_disk_on_termination    = true
  delete_data_disks_on_termination = false

  # TODO this to be more automated
  storage_image_reference {
    publisher = "OpenLogic"
    offer     = "CentOS"
    sku       = "7.3"
    version   = "latest"
  }
  storage_os_disk {
    name          = "centosvm-disk1"
    name          = "centosvm-disk1"
    vhd_uri       = "${azurerm_storage_account.storage1.primary_blob_endpoint}${azurerm_storage_container.container.name}/osdisk.vhd"
    caching       = "ReadWrite"
    create_option = "FromImage"
  }
  os_profile {
    computer_name  = "appServer-${count.index}"
    admin_username = "${var.username}"
    admin_password = "${random_id.app-user-password.b64}"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags {
    env    = "${var.environment_tag}"
  }
}

resource "random_id" "app-user-password" {
  byte_length = 8
}
