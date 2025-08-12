resource "azurerm_private_dns_zone" "dns_zone" {
  name                = "privatelink.postgres.database.azure.com"
  resource_group_name = var.resource_group_name
}

resource "azurerm_private_dns_zone_virtual_network_link" "link" {
  name                  = "postgres-${var.vnet_name}"
  private_dns_zone_name = azurerm_private_dns_zone.dns_zone.name
  virtual_network_id    = var.vnet_id
  resource_group_name   = var.resource_group_name
}

resource "azurerm_postgresql_flexible_server" "flexible_server" {
  name                          = var.server_name
  resource_group_name           = var.resource_group_name
  location                      = var.location
  version                       = var.postgres_version
  delegated_subnet_id           = var.subnet_db_id
  private_dns_zone_id           = azurerm_private_dns_zone.dns_zone.id
  public_network_access_enabled = false
  administrator_login           = var.admin_username
  administrator_password        = var.admin_password
  zone                          = var.availability_zone

  storage_mb   = var.storage_mb
  storage_tier = var.storage_tier

  sku_name = var.sku_name

  depends_on = [azurerm_private_dns_zone_virtual_network_link.link]
}

resource "azurerm_postgresql_flexible_server_database" "server_database" {
  name      = var.database_name
  server_id = azurerm_postgresql_flexible_server.flexible_server.id
  collation = var.db_collation
  charset   = var.db_charset
}