variable "resource_group_name" {
  description = "Name of the Azure resource group"
  type        = string
  default     = "rg-azure-secure-infra-dev"
}

variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "eastus"
}

variable "storage_account_name" {
  description = "Name of the Azure Storage Account"
  type        = string
  default     = "stsecinfra26josiah"
}