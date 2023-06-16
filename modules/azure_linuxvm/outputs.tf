output "azurerm_linux_virtual_machine_id" {
  value = azurerm_linux_virtual_machine.linuxvm.id
}

output "azurerm_linux_virtual_machine_ip_addresses" {
  value = azurerm_linux_virtual_machine.linuxvm.private_ip_addresses
}

output "azurerm_linux_virtual_machine_vm_id" {
  value = azurerm_linux_virtual_machine.linuxvm.virtual_machine_id
}

output "azurerm_managed_disk_id" {
  value = azurerm_managed_disk.data_disk.id
}

output "azurerm_network_interface_dns_servers" {
  value = azurerm_network_interface.nic.applied_dns_servers
}

output "azurerm_network_interface_id" {
  value = azurerm_network_interface.nic.id
}

output "azurerm_network_interface_private_ip" {
  value = azurerm_network_interface.nic.private_ip_address
}

output "azurerm_virtual_machine_data_disk_attachment_id" {
  value = azurerm_virtual_machine_data_disk_attachment.disk_attachment.id
}