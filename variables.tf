variable "resource_group_location" {
  type        = string
  default     = "westeurope"
  description = "Location of the resource group."
}

variable "resource_group_name" {
  type        = string
  default     = "rg-sandbox-lgo"
  description = "Name of the resource group name."
}

variable "storage_account_name" {
  type        = string
  default     = "lgosa"
  description = "Name of the resource group name."
}

variable "frontend_port_name" {
  type        = string
  default     = "frontendport"
  description = "Name of the resource group name."
}

variable "frontend_ip_configuration_name" {
  type        = string
  default     = "frontendportconf"
  description = "Name of the resource group name."
}

variable "backend_address_pool_name" {
  type        = string
  default     = "backendpool1"
  description = "Name of the resource group name."
}

variable "http_setting_name" {
  type        = string
  default     = "httpsettings1"
  description = "Name of the resource group name."
}

variable "listener_name" {
  type        = string
  default     = "listener1"
  description = "Name of the resource group name."
}

variable "request_routing_rule_name" {
  type        = string
  default     = "listener1"
  description = "Name of the resource group name."
}
variable "vault_name" {
  type        = string
  description = "The name of the key vault to be created. The value will be randomly generated if blank."
  default     = ""
}
variable "sku_name" {
  type        = string
  description = "The SKU of the vault to be created."
  default     = "standard"
  validation {
    condition     = contains(["standard", "premium"], var.sku_name)
    error_message = "The sku_name must be one of the following: standard, premium."
  }
}
variable "key_permissions" {
  type        = list(string)
  description = "List of key permissions."
  default     = ["List", "Create", "Delete", "Get", "Purge", "Recover", "Update", "GetRotationPolicy", "SetRotationPolicy"]
}

variable "secret_permissions" {
  type        = list(string)
  description = "List of secret permissions."
  default     = ["Set"]
}