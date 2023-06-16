locals {
  keyvault_name    = substr(format("kv%s%s", local.application_name, random_string.unique_string.result), 0, 23)
  application_name = substr(lower(replace(var.application_name, "/[[:^alnum:]]/", "")), 0, 15)

  location = data.azurerm_resource_group.resource_group.location

  # This list includes the elastic IP addresses from AWS (site of tfc-agent) and the public ips of the KC office.
  burnsmcd_public_ips = [
    "141.193.16.0/23",
    "34.224.186.248",
    "52.201.108.38",
    "52.86.146.136",
    "54.146.116.27",
    "15.181.98.47",
    "15.181.98.77"
  ]
  keyvault_public_ips = concat(var.keyvault_public_ips, local.burnsmcd_public_ips)
}