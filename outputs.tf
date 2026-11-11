output "resource_group_name" {
  description = "Name of the deployed resource group"
  value       = azurerm_resource_group.core.name
}

output "resource_group_id" {
  description = "Unique Azure resource ID of the resource group"
  value       = azurerm_resource_group.core.id
}

output "storage_account_name" {
  description = "Name of the deployed Azure Storage Account"
  value       = azurerm_storage_account.app.name
}

output "storage_account_id" {
  description = "Azure resource ID of the Storage Account"
  value       = azurerm_storage_account.app.id
}