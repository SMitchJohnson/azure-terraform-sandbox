locals {
  data_disk_name         = "${var.linuxvm_name}-data"
  linuxvm_username       = "bmcdadmin"
  location               = data.azurerm_resource_group.rg.location
  network_interface_name = "${var.linuxvm_name}-nic"
  os_disk_name = "${var.linuxvm_name}-osdisk"
}