resource "azurerm_container_registry" "formbricks_cr" {
  name = var.name
  resource_group_name = var.resource_group_name
  sku = var.sku
  location = var.location
  tags = var.tags
}