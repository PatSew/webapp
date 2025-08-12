resource "azurerm_resource_group" "rgapp" {
  name = "rg-${var.application_name}-${var.environment_name}"
  location = var.primary_location
}

resource "azurerm_resource_group" "rgcore" {
  name = "rg-core-${var.application_name}-${var.environment_name}"
  location = var.primary_location
}

resource "random_password" "db_password" {
  length  = 10
  special = true
}

resource "azurerm_container_registry" "acr" {
  name                = "acr${var.application_name}${var.environment_name}${var.app_suffix}"
  resource_group_name = azurerm_resource_group.rgcore.name
  location            = azurerm_resource_group.rgcore.location
  sku                 = "Standard"
  admin_enabled       = true
}

module "tf-network" {
  source              = "../../../tf-modules/tf-network"
  application_name    = var.application_name
  environment_name    = var.environment_name
  primary_location    = var.primary_location
  base_address_space  = var.base_address_space
  resource_group_name = azurerm_resource_group.rgapp.name
}

module "tf-db" {
  source              = "../../../tf-modules/tf-db"
  resource_group_name = azurerm_resource_group.rgapp.name
  location            = var.primary_location
  vnet_id             = module.tf-network.vnet_id
  vnet_name           = module.tf-network.vnet_name
  subnet_db_id        = module.tf-network.subnet_db_id

  server_name   = "psqlflexibleserver-${var.application_name}-${var.environment_name}-${var.app_suffix}"
  admin_username = "${var.admin_username_db}"
  admin_password = "${random_password.db_password.result}"

  database_name = "postgresdb"
}

module "tf-app" {
  source                  = "../../../tf-modules/tf-app"
  web_app_name            = "app-${var.application_name}-${var.environment_name}-${var.app_suffix}"
  application_name        = var.application_name
  environment_name        = var.environment_name
  resource_group_name     = azurerm_resource_group.rgapp.name
  location                = var.primary_location
  subnet_id               = module.tf-network.subnet_app_id
  postgres_server_fqdn    = module.tf-db.postgres_server_fqdn
  postgres_db_name        = module.tf-db.postgres_db_name
  postgres_admin_username = "${var.admin_username_db}"
  postgres_admin_password = "${random_password.db_password.result}"
  repo_url                = "https://github.com/PatSew/webapp"
  repo_branch             = "feature/${var.branch}"
  acr_admin_username      = azurerm_container_registry.acr.admin_username
  acr_admin_password      = azurerm_container_registry.acr.admin_password
  acr_image_name          = "myapp:latest"
  acr_registry_url        = "https://${azurerm_container_registry.acr.login_server}"
}