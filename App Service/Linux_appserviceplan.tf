# creates a resource group
resource "azurerm_resource_group" "LASP" {
 name     = "App-Service-Plan"
 location = "West US" 
}

# creates App service plans
resource "azurerm_service_plan" "LSP0" {
  name                = "App-serviceplan-0"
  location            = azurerm_resource_group.LASP.location
  resource_group_name = azurerm_resource_group.LASP.name
  os_type             = "Linux"
  sku_name            = "F1"

  #F1 = 1 GB of memory, 60 min/day compute, free
}

resource "azurerm_service_plan" "LSP1" {
  name                = "App-serviceplan-1"
  location            = azurerm_resource_group.LASP.location
  resource_group_name = azurerm_resource_group.LASP.name
  os_type             = "Linux"
  sku_name            = "B1"

  #B1 = 100 total ACU (Azure_compute_units), 1.75 GB of memory, A-series compute equivalent, 13.14 USD/Month (Equivalent) 
}

resource "azurerm_service_plan" "LSP2" {
  name                = "App-serviceplan-2"
  location            = azurerm_resource_group.LASP.location
  resource_group_name = azurerm_resource_group.LASP.name
  os_type             = "Linux"
  sku_name            = "B2"

  #B2 = 200 total ACU (Azure_compute_units), 3.5 GB of memory, A-series compute equivalent, 25.55 USD/Month (Equivalent)
}

# creates Linux web app
resource "azurerm_linux_web_app" "as_Linux" {
  name                   = "asLinux-1"
  resource_group_name    = azurerm_resource_group.LASP.name
  location               = azurerm_resource_group.LASP.location
  service_plan_id        = azurerm_resource_group.LASP.id

  site_config {}
}