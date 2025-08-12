resource "azurerm_service_plan" "service_plan" {
  name                = "asp-${var.application_name}-${var.environment_name}-32167"
  resource_group_name = var.resource_group_name
  location            = var.location
  os_type             = "Linux"
  sku_name            = "P1v3"
}

resource "azurerm_linux_web_app" "webapp" {
  name                      = var.web_app_name
  resource_group_name       = var.resource_group_name
  location                  = var.location
  service_plan_id           = azurerm_service_plan.service_plan.id
  virtual_network_subnet_id = var.subnet_id

  site_config {
    application_stack {
      python_version = "3.12"
    }
  }

  app_settings = {
    AZURE_POSTGRESQL_HOST       = var.postgres_server_fqdn
    AZURE_POSTGRESQL_NAME       = var.postgres_db_name
    AZURE_POSTGRESQL_PASSWORD   = var.postgres_admin_password
    AZURE_POSTGRESQL_USER       = var.postgres_admin_username
    SCM_DO_BUILD_DURING_DEPLOYMENT = "1"
  }

  depends_on = []
}