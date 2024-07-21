output "private_ip" {
  value       = azurerm_private_endpoint.this.private_service_connection[0].private_ip_address
  description = "The private ip of the private endpoint resource."
}

output "name" {
  value       = azurerm_private_endpoint.this.name
  description = "The name of the private endpoint."
}

output "id" {
  value       = azurerm_private_endpoint.this.id
  description = "The id of the private endpoint."
}

output "location" {
  value       = azurerm_private_endpoint.this.location
  description = "The location of the private endpoint."
}

output "resource_group_name" {
  value       = azurerm_private_endpoint.this.resource_group_name
  description = "The name of the resource group of the private endpoint."
}
