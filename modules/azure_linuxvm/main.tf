module "key_vault" {
  source = "../azure_keyvault"
  application_name = "linuxvmtest"
  managed_service_identity_id = "8c5244c2-6a9e-4118-ba02-cf8328503a8e"
  resource_group_name = var.resource_group_name
  tags = var.tags
}

resource "azurerm_key_vault_key" "generated_key" {
  name = "generated-key"
  key_vault_id = module.key_vault.azurerm_key_vault_id
  key_type = "RSA"
  key_size = 4096

  key_opts = [
    "decrypt",
    "encrypt",
    "sign",
    "unwrapKey",
    "verify",
    "wrapKey",
  ]
  tags = var.tags
}

resource "azurerm_network_interface" "nic" {
  name                          = local.network_interface_name
  location                      = local.location
  resource_group_name           = var.resource_group_name
  enable_accelerated_networking = var.enable_accelerated_networking


  ip_configuration {
    name                          = "ipconfig"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }

  tags = var.tags
}

resource "azurerm_linux_virtual_machine" "linuxvm" {
  name                = var.linuxvm_name
  resource_group_name = var.resource_group_name
  location            = local.location
  size                = var.linuxvm_size
  admin_username      = local.linuxvm_username
  #disable_password_authentication = false
  #admin_password = "xDz8Q~RmyE7lKC4zZDqfCZaLgX9DPK3Ref~9TcY3"

  admin_ssh_key {
    username = "bmcdadmin"
    public_key = azurerm_key_vault_key.generated_key.public_key_openssh
  }

  network_interface_ids = [
    azurerm_network_interface.nic.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = var.os_storage_account_type
    name = local.os_disk_name
    #disk_size_gb = var.os_disk_size
  }

  source_image_reference {
    publisher = var.image_reference_publisher
    offer     = var.image_reference_offer
    sku       = var.image_reference_sku
    version   = var.image_reference_version
  }

  tags = var.tags
}

resource "azurerm_managed_disk" "data_disk" {
  name                 = local.data_disk_name
  resource_group_name  = var.resource_group_name
  location             = local.location
  storage_account_type = var.data_storage_account_type
  create_option        = "Empty"
  disk_size_gb         = var.data_disk_size
  tags                 = var.tags
}

resource "azurerm_virtual_machine_data_disk_attachment" "disk_attachment" {
  managed_disk_id    = azurerm_managed_disk.data_disk.id
  virtual_machine_id = azurerm_linux_virtual_machine.linuxvm.id
  lun                = "1"
  caching            = "ReadWrite"
}