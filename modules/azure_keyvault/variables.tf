
variable "application_name" {
  type        = string
  description = "Name of the application the key vault will be used for. It will be included in the key vault name"
}

variable "certificate_permissions" {
  type        = list(string)
  description = "List of certificate permissions, must be one or more from the following: `Backup`, `Create`, `Delete`, `DeleteIssuers`, `Get`, `GetIssuers`, `Import`, `List`, `ListIssuers`, `ManageContacts`, `ManageIssuers`, `Purge`, `Recover`, `Restore`, `SetIssuers`, and `Update`."
  default     = ["Backup", "Create", "Delete", "DeleteIssuers", "GetIssuers", "Import", "List", "ListIssuers", "ManageContacts", "ManageIssuers", "Purge", "Recover", "Restore", "SetIssuers", "Update"]
}

variable "enabled_for_disk_encryption" {
  type        = bool
  description = "Specifies whether Azure Disk Encryption is permitted to retrieve secrets from the vault and unwrap keys."
  default     = true
}

variable "keyvault_public_ips" {
  type        = list(string)
  description = "One or more IP Addresses, or CIDR Blocks which should be able to access the Key Vault. This list will be combined with a list of Burns & McDonnell public IP addresses. "
  default     = []
}

variable "key_permissions" {
  type        = list(string)
  description = "List of key permissions. Possible values are `Backup`, `Create`, `Decrypt`, `Delete`, `Encrypt`, `Get`, `Import`, `List`, `Purge`, `Recover`, `Restore`, `Sign`, `UnwrapKey`, `Update`, `Verify`, `WrapKey`, `Release`, `Rotate`, `GetRotationPolicy`, and `SetRotationPolicy`."
  default     = ["List", "Create", "Delete", "Get", "Purge", "Recover", "Update", "GetRotationPolicy", "SetRotationPolicy"]
}

variable "managed_service_identity_id" {
  type        = string
  description = "The Managed Service Identity ID. The object ID of a user, service principal or security group in the Azure Active Directory tenant for the vault. The object ID must be unique for the list of access policies."
}

variable "network_acls_bypass" {
  type        = string
  description = "Specifies whether traffic is bypassed for Azure services. Valid options are `AzureServices` or `None`."
  default     = "AzureServices"
}

variable "purge_protection_enabled" {
  type        = bool
  description = "Specifies whether protection against purge is enabled for this Key Vault."
  default     = true
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which to create the Key Vault. Changing this forces a new resource to be created."
}

variable "secret_permissions" {
  type        = list(string)
  description = "List of secret permissions, must be one or more from the following: `Backup`, `Delete`, `Get`, `List`, `Purge`, `Recover`, `Restore`, and `Set`."
  default     = ["Backup", "Delete", "Get", "List", "Purge", "Recover", "Restore", "Set"]
}

variable "soft_delete_retention_days" {
  type        = number
  description = "The number of days that items should be retained for once soft-deleted. This value can be between `7` and `90` (the Azure default if no value supplied)"
  default     = 90
}

variable "virtual_network_subnet_ids" {
  type        = list(string)
  description = "One or more Subnet IDs which should be able to access this Key Vault."
  default     = []
}

/*variable "key_name" {
  type = string
  description = "Specifies the name of the Key Vault Key. Changing this forces a new resource to be created."
}

variable "key_type" {
  type = string
  description = "Specifies the Key Type to use for this Key Vault Key. Possible values are EC (Elliptic Curve), EC-HSM, RSA and RSA-HSM. Changing this forces a new resource to be created."
}

variable "key_size" {
  type = number
  description = "Specifies the Size of the RSA key to create in bytes. For example, 1024 or 2048. Note: This field is required if key_type is RSA or RSA-HSM. Changing this forces a new resource to be created."
}

variable "key_opts" {
  type = list(string)
  description = "A list of JSON web key operations. Possible values include: decrypt, encrypt, sign, unwrapKey, verify and wrapKey. Please note these values are case sensitive."
  default     = ["decrypt", "encrypt", "sign", "unwrapKey", "verify", "wrapKey"]
}
*/

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource."
}