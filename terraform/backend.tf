terraform {
  required_version = ">= 1.15"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.81"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-formbricks-tfstate"
    storage_account_name = "tfstateformbricks"
    container_name       = "tfstate"
    key                  = "formbricks/terraform.tfstate"
  }
}

provider azurerm {
  features {}
}