terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "<= 3.59.0"
    }
    solidserver = {
      source = "EfficientIP-Labs/solidserver"
      version = "<=1.1.18"
    }
  }
}

provider "azurerm" {
  alias = "default"
  features {}
  skip_provider_registration = true
}

provider "azurerm" {
  features {}
}