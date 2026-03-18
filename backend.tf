terraform {

  backend "azurerm" {
    resource_group_name  = "tf-state-rg"
    storage_account_name = "tfstateaksdemo1234"
    container_name       = "tfstate"
    key                  = "aks-poc.terraform.tfstate"
  }

}