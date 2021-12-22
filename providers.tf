terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.90.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0.1"
    }
  }
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "pjdevelop"

    workspaces {
      name = "terraform-azurerm-demo-ddaks-integrate"
    }
  }
}

provider "azurerm" {
  features {
    template_deployment {
      delete_nested_items_during_deletion = false
    }
    key_vault {
      purge_soft_delete_on_destroy = true
    }
  }
}

provider "azurerm" {
  alias           = "management"
  subscription_id = var.management_subscription_id
  features {}
}

provider "azurerm" {
  alias           = "connectivity"
  subscription_id = var.connectivity_subscription_id
  features {}
}
