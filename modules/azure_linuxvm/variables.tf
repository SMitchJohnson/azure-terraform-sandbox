variable "data_disk_size" {
  type        = string
  description = "Specifies the size of the managed disk to create in gigabytes. If create_option is Copy or FromImage, then the value must be equal to or greater than the source's size. The size can only be increased."
  default     = "100"
}

variable "data_storage_account_type" {
  type        = string
  description = "The type of storage to use for the managed disk. Possible values are Standard_LRS, StandardSSD_ZRS, Premium_LRS, PremiumV2_LRS, Premium_ZRS, StandardSSD_LRS or UltraSSD_LRS."
  default     = "StandardSSD_LRS"
}

variable "enable_accelerated_networking" {
  type        = bool
  description = "Specifies whether accelerated networking will be enabled. true/false"
  default     = false
}

variable "image_reference_offer" {
  type        = string
  description = "Specifies the offer of the image used to create the virtual machines. Changing this forces a new resource to be created."
  default     = "0001-com-ubuntu-server-jammy"
}

variable "image_reference_publisher" {
  type        = string
  description = "Specifies the publisher of the image used to create the virtual machines. Changing this forces a new resource to be created."
  default     = "Canonical"
}

variable "image_reference_sku" {
  type        = string
  description = "Specifies the SKU of the image used to create the virtual machines. Changing this forces a new resource to be created."
  default     = "22_04-lts"
}
variable "image_reference_version" {
  type        = string
  description = "Specifies the version of the image used to create the virtual machines. Changing this forces a new resource to be created."
  default     = "latest"
}

variable "linuxvm_name" {
  type        = string
  description = "The name of the Linux Virtual Machine. Changing this forces a new resource to be created."
}

variable "linuxvm_size" {
  type        = string
  description = "The SKU which should be used for this Virtual Machine"
}

/*variable "os_disk_size" {
  type = number
  description = "The Size of the Internal OS Disk in GB, if you wish to vary from the size used in the image this Virtual Machine is sourced from."
  default = 30
}*/

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which to create the Virtual Machine. Changing this forces a new resource to be created."
}

variable "os_storage_account_type" {
  type        = string
  description = "The Type of Storage Account which should back this the Internal OS Disk. Possible values are Standard_LRS, StandardSSD_LRS, Premium_LRS, StandardSSD_ZRS and Premium_ZRS. Changing this forces a new resource to be created."
  default     = "StandardSSD_LRS"
}

variable "subnet_id" {
  type        = string
  description = "Specifies the subnet that the network interface will reside in."
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource."
}