output "id" {
  description = "ID of the ACR."
  value       = azurerm_container_registry.formbricks-cr.id
}

output "login_server" {
  description = "URL to login to the container registry."
  value       = azurerm_container_registry.formbricks-cr.login_server
}