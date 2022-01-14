terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
  # backend "local" {
  #  }

  backend "azurerm" {
    resource_group_name  = "dowd-devops-rg"
    storage_account_name = "dowdtf"
    container_name       = "tfstatedowd"
    key                  = "terraform.tfstate"
  }

}

provider "azurerm" {
  features {}
}

module "acr" {

  for_each    = toset(["dowd1", "dowd2", "dowd3"])
  source      = "./modules/acr"
  environment = "Production"
  name        = each.key

}

