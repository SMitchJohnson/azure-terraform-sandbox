resource "random_string" "unique_string" {
  length  = 6
  special = false
  upper   = false
}

resource "azurerm_key_vault" "vault" {
  name                        = local.keyvault_name
  location                    = local.location
  resource_group_name         = var.resource_group_name
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  sku_name                    = "premium"
  enabled_for_disk_encryption = var.enabled_for_disk_encryption
  soft_delete_retention_days  = var.soft_delete_retention_days
  purge_protection_enabled    = var.purge_protection_enabled

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = var.managed_service_identity_id

    key_permissions         = var.key_permissions
    secret_permissions      = var.secret_permissions
    certificate_permissions = var.certificate_permissions
  }

  network_acls {
    default_action             = "Deny"
    bypass                     = var.network_acls_bypass
    ip_rules                   = local.keyvault_public_ips
    virtual_network_subnet_ids = var.virtual_network_subnet_ids
  }

  tags = var.tags
}

/*resource "azurerm_key_vault_key" "key" {
  name = var.key_name

  key_vault_id = azurerm_key_vault.vault.id
  key_type = var.key_type
  key_size = var.key_size
  key_opts = var.key_opts
}
*/
