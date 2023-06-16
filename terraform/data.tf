data "azurerm_subnet" "vm_subnet" {
  name                 = "cor-snet-neus-mitch-test-1"
  virtual_network_name = "cor-vnet-neus-mitch-test"
  resource_group_name  = "azure-databricks-sandbox"
}

data "azurerm_resource_group" "rg" {
  provider = azurerm.default
  name     = "azure-databricks-sandbox"
}