resource "azurerm_resource_group" "formbricks" {
  name     = "rg-${var.project}-${var.environment}"
  location = var.location
  tags     = var.tags
}

module "network" {
  source              = "./modules/network"
  resource_group_name = azurerm_resource_group.formbricks.name
  location            = azurerm_resource_group.formbricks.location
  tags                = var.tags 
}