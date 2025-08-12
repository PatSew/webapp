output "webapp_id" {
  value       = azurerm_linux_web_app.webapp.id
}

output "webapp_default_hostname" {
  value       = azurerm_linux_web_app.webapp.default_hostname
}