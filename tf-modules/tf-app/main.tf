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
      docker_image_name   = var.acr_image_name
      docker_registry_url = var.acr_registry_url
      docker_registry_username = var.acr_admin_username
      docker_registry_password = var.acr_admin_password
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