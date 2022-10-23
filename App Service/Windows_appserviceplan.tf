# creates a resource group
resource "azurerm_resource_group" "WASP" {
 name     = "App-Service-Plan"
 location = "West US" 
}

# creates App service plans
resource "azurerm_service_plan" "WSP0" {
  name                = "App-serviceplan-0"
  location            = azurerm_resource_group.WASP.location
  resource_group_name = azurerm_resource_group.WASP.name
  os_type             = "Windows"
  sku_name            = "F1"

  #F1 = 1 GB of memory, 60 min/day compute, free
}

resource "azurerm_service_plan" "WSP1" {
  name                = "App-serviceplan-1"
  location            = azurerm_resource_group.WASP.location
  resource_group_name = azurerm_resource_group.WASP.name
  os_type             = "Windows"
  sku_name            = "B1"

  #B1 = 100 total ACU (Azure_compute_units), 1.75 GB of memory, A-series compute equivalent, 13.14 USD/Month (Equivalent) 
}

resource "azurerm_service_plan" "WSP2" {
  name                = "App-serviceplan-2"
  location            = azurerm_resource_group.WASP.location
  resource_group_name = azurerm_resource_group.WASP.name
  os_type             = "Windows"
  sku_name            = "B2"

  #B2 = 200 total ACU (Azure_compute_units), 3.5 GB of memory, A-series compute equivalent, 25.55 USD/Month (Equivalent)
}

# Creates windows web app
resource "azurerm_windows_web_app" "as_Windows" {
  name                   = "aswindows-1"
  resource_group_name    = azurerm_resource_group.WASP.name
  location               = azurerm_resource_group.WASP.location
  service_plan_id        = azurerm_resource_group.WASP.id

  site_config {}
}