# Create Network Interface
resource "azurerm_network_interface" "promond-nic" {
  count               = "${var.mod_mon_vm_count}"
  name                = "${azurerm_resource_group.rmgmondRG.name}-Promnic-${count.index}"
  location            = "${var.azure_region}"
  resource_group_name = "${azurerm_resource_group.rmgmondRG.name}"
  dns_servers         = ["8.8.8.8", "8.8.4.4"]

  ip_configuration {
    name                          = "${azurerm_resource_group.rmgmondRG.name}-Promnic-${count.index}"
    subnet_id                     = "${azurerm_subnet.pubsubnet1.id}"
    private_ip_address_allocation = "dynamic"
    #private_ip_address            = "10.0.1.2"
    public_ip_address_id = "${azurerm_public_ip.rmgmond-pubip.id}"
  }
  tags {
    env    = "${var.environment_tag}"
  }
}

# Create Public IP
resource "azurerm_public_ip" "rmgmond-pubip" {
  name                         = "${azurerm_resource_group.rmgmondRG.name}-pubip"
  location                     = "${var.azure_region}"
  resource_group_name          = "${azurerm_resource_group.rmgmondRG.name}"
  public_ip_address_allocation = "dynamic"
  domain_name_label            = "${var.domain_name_label}"

  tags {
    environment    = "${var.environment_tag}"    
  }
}

# Create Prometheus server Virtual Machine(s)
resource "azurerm_virtual_machine" "rmgmond-prom" {
  name                  = "rmgmond-prom-${count.index}"
  location              = "${var.azure_region}"
  count                 = "${var.mod_mon_vm_count}"
  vm_size               = "${var.vm_size}"
  depends_on            = ["azurerm_virtual_network.mond_network"]
  resource_group_name   = "${azurerm_resource_group.rmgmondRG.name}"
  #network_interface_ids = ["${element(azurerm_network_interface.promond-nic.*.id, count.index)}"]
  network_interface_ids = ["${azurerm_network_interface.promond-nic.id}"]

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
    vhd_uri       = "${azurerm_storage_account.storage1.primary_blob_endpoint}${azurerm_storage_container.container.name}/prom${count.index}-osdisk.vhd"
    caching       = "ReadWrite"
    create_option = "FromImage"
  }
  os_profile {
    computer_name  = "promethueus-mond-${count.index}"
    admin_username = "${var.username}"
    admin_password = "${random_id.prom-user-password.b64}"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags {
    env    = "${var.environment_tag}"
  }
}

resource "random_id" "prom-user-password" {
  byte_length = 8
}
