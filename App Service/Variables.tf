variable "resource_group_deployment_name" {
  type        = string
  description = "Deployment name of resource group"
}

variable "resource_group_name" {
  type        = string
  description = "The name of resource group"
}

variable "resource_group_location" {
  type        = string
  description = "Location of resource group"
}

variable "Service_plan_deployment_name" {
  type        = string
  description = "Deployment name of service plan"
}

variable "Service_plan_name" {
  type        = string
  description = "Name of service plan"
}

variable "Service_plan_location" {
  type        = string
  description = "Location of Service plan"
}

variable "Service_plan_resource_group_name" {
  type        = string
  description = "Resource group of service plan"
}

variable "os_type" {
  type        = string
  description = "The OS type for service plan"
}

variable "sku_name" {
  type        = string
  description = "The SKU name of Service Plan"
}

variable "web_app_deployment_name" {
  type        = string
  description = "Deployment name of Web App"
}

variable "web_app_name" {
  type        = string
  description = "Name of Web App"
}

variable "web_app_location" {
  type        = string
  description = "Location of Web App"
}

variable "web_app_resource_group_name" {
  type        = string
  description = "Resource group of Web App"
}

variable "service_plan_id" {
  type = string
  description = "id of service plan"
}

variable "deployment_count" {
  type        = number
  description = "Number of template deployments"
}