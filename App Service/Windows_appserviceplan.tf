# creates a resource group
resource "azurerm_resource_group" "resource_group_deployment" {
 name     = var.resource_group_name
 location = var.resource_group_location
}

# creates App service plans
resource "azurerm_service_plan" "service_plan_deployment" {
  name                = var.Service_plan_name
  location            = var.Service_plan_location
  resource_group_name = var.Service_plan_resource_group_name
  os_type             = var.os_type
  sku_name            = var.sku_name
}

#Sku-names:
#F1 = 1 GB of memory, 60 min/day compute, free
#B1 = 100 total ACU (Azure_compute_units), 1.75 GB of memory, A-series compute equivalent, 13.14 USD/Month (Equivalent) 
#B2 = 200 total ACU (Azure_compute_units), 3.5 GB of memory, A-series compute equivalent, 25.55 USD/Month (Equivalent)


# Creates Windows web app
resource "azurerm_windows_web_app" "Windows_web_app_deployment" {
  name                = var.web_app_name
  location            = var.web_app_location
  resource_group_name = var.web_app_resource_group_name
  service_plan_id     = azurerm_service_plan.service_plan_deployment.id

  site_config {}
  
}
