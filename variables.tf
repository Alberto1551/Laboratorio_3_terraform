variable "subscription_id" {
  description = "The Azure subscription ID."
  type        = string
  sensitive   = true
}

variable "organization" {
  description = "Abreviatura de la organización."
  type        = string
  default     = "utvt"
}

variable "project_name" {
  description = "Nombre corto del proyecto o aplicación."
  type        = string
  default     = "integradora"

  validation {
    condition     = length(var.project_name) >= 3 && length(var.project_name) <= 20
    error_message = "project_name debe contener entre 3 y 20 caracteres."
  }
}

variable "environment" {
  description = "Ambiente donde se desplegarán los recursos."
  type        = string
  default     = "qa"

  validation {
    condition     = contains(["dev", "test", "qa", "stg", "prod"], var.environment)
    error_message = "environment debe ser dev, test, qa, stg o prod."
  }
}

variable "location" {
  description = "Región de Azure donde se desplegarán los recursos."
  type        = string
  default     = "mexicocentral"
}

variable "tags" {
  description = "Etiquetas comunes para los recursos de Azure."
  type        = map(string)
  default = {
    managed_by = "terraform"
  }
}

variable "service_plan_sku_name" {
  type    = string
  default = "F1"
}

variable "application_type" {
  description = "Application type for the Azure Application Insights resource"
  type        = string
  default     = "web"
}

variable "node_version" {
  description = "Node.js version for the Azure Linux Web App"
  type        = string
  default     = "24-lts"
}

variable "log_analytics_sku" {
  description = "SKU del espacio de trabajo de Log Analytics"
  type        = string
  default     = "PerGB2018"
}

variable "web_app_name" {
  description = "Nombre de la aplicación web del entorno QA (debe ser único en todo Azure)"
  type        = string
  default     = "app-utvt-integradora-web-qa-mxc-001"
}
