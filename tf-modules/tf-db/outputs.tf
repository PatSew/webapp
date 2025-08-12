output "postgres_server_name" {
  value = azurerm_postgresql_flexible_server.flexible_server.name
}

output "postgres_db_name" {
  value = azurerm_postgresql_flexible_server_database.server_database.name
}

output "postgres_server_id" {
  value = azurerm_postgresql_flexible_server.flexible_server.id
}

output "postgres_server_fqdn" {
  value = azurerm_postgresql_flexible_server.flexible_server.fqdn
}

output "postgres_admin_username" {
  value       = azurerm_postgresql_flexible_server.flexible_server.administrator_login
}

output "postgres_admin_password" {
  value       = azurerm_postgresql_flexible_server.flexible_server.administrator_password
  sensitive   = true
}

output "private_dns_zone_id" {
  value = azurerm_private_dns_zone.dns_zone.id
}