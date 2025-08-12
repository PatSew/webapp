
output "vnet_id" {
  value = azurerm_virtual_network.virtual_network.id
}

output "vnet_name" {
  value = azurerm_virtual_network.virtual_network.name
}

output "subnet_base_id" {
  value = azurerm_subnet.firstsub.id
}

output "subnet_app_id" {
  value = azurerm_subnet.secondsub.id
}

output "subnet_db_id" {
  value = azurerm_subnet.thirdsub.id
}