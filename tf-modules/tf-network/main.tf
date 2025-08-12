resource "azurerm_virtual_network" "virtual_network" {
  name                = "vnet-${var.application_name}-${var.environment_name}"
  location            = var.primary_location
  resource_group_name = var.resource_group_name
  address_space       = [var.base_address_space]
}

locals {
  first_address_space  = cidrsubnet(var.base_address_space, 2, 0)
  second_address_space = cidrsubnet(var.base_address_space, 2, 1)
  third_address_space  = cidrsubnet(var.base_address_space, 2, 2)
}

resource "azurerm_subnet" "firstsub" {
  name                 = "snet-base"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.virtual_network.name
  address_prefixes     = [local.first_address_space]
}

resource "azurerm_subnet" "secondsub" {
  name                 = "snet-app"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.virtual_network.name
  address_prefixes     = [local.second_address_space]
  delegation {
    name = "sf"
    service_delegation {
      name = "Microsoft.Web/serverFarms"
      actions = [
        "Microsoft.Network/virtualNetworks/subnets/action",
      ]
    }
  }
}

resource "azurerm_subnet" "thirdsub" {
  name                 = "snet-db"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.virtual_network.name
  address_prefixes     = [local.third_address_space]
  service_endpoints    = ["Microsoft.Storage"]
  delegation {
    name = "fs"
    service_delegation {
      name = "Microsoft.DBforPostgreSQL/flexibleServers"
      actions = [
        "Microsoft.Network/virtualNetworks/subnets/join/action",
      ]
    }
  }
}