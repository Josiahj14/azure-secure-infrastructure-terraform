terraform {
  required_version = ">= 1.10.0, <2.0.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 5.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-terraform-state-dev"
    storage_account_name = "sttfstatejosiah26"
    container_name       = "tfstate"
    key                  = "secure-infra-dev.tfstate"

    use_azuread_auth = true
    use_cli          = true
  }
}
