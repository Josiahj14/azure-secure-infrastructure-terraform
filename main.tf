resource "azurerm_resource_group" "core" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "core" {
  name                = "vnet-secure-infra-dev"
  address_space       = ["10.20.0.0/16"]
  location            = azurerm_resource_group.core.location
  resource_group_name = azurerm_resource_group.core.name

  tags = {
    environment = "dev"
    project     = "secure-azure-infrastructure"
  }
}

resource "azurerm_subnet" "app" {
  name                 = "snet-app-dev"
  resource_group_name  = azurerm_resource_group.core.name
  virtual_network_name = azurerm_virtual_network.core.name
  address_prefixes     = ["10.20.1.0/24"]
}

resource "azurerm_network_security_group" "app" {
  name                = "nsg-app-dev"
  location            = azurerm_resource_group.core.location
  resource_group_name = azurerm_resource_group.core.name

  tags = {
    environment = "dev"
    project     = "secure-azure-infrastructure"
  }
}

resource "azurerm_network_security_rule" "deny_ssh" {
  name      = "Deny-SSH-Inbound"
  priority  = 100
  direction = "Inbound"
  access    = "Deny"
  protocol  = "Tcp"

  source_port_range          = "*"
  destination_port_range     = "22"
  source_address_prefix      = "*"
  destination_address_prefix = "*"

  resource_group_name         = azurerm_resource_group.core.name
  network_security_group_name = azurerm_network_security_group.app.name
}

resource "azurerm_subnet_network_security_group_association" "app" {
  subnet_id                 = azurerm_subnet.app.id
  network_security_group_id = azurerm_network_security_group.app.id
}

resource "azurerm_storage_account" "app" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.core.name
  location                 = azurerm_resource_group.core.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  https_traffic_only_enabled      = true
  min_tls_version                 = "TLS1_2"
  allow_nested_items_to_be_public = false
  public_network_access           = "Disabled"

  tags = {
    environment = "dev"
    project     = "secure-azure-infrastructure"
  }
}

