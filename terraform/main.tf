module "linuxvm" {
  #source  = "app.terraform.io/BurnsMcDonnell/linux-virtual-machine/azurerm"
  #version = "0.0.1"
  source = "../modules/azure_linuxvm"

  linuxvm_name        = "cor-linvm-test"
  linuxvm_size        = "Standard_D2s_v3"
  resource_group_name = "azure-databricks-sandbox"
  subnet_id           = data.azurerm_subnet.vm_subnet.id
  tags                = data.azurerm_resource_group.rg.tags
}