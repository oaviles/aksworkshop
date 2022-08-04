provider "azurerm" {
    version = "~>2.0"
    features {}
}

terraform {
  backend "azurerm" {
    resource_group_name   = "terraformrg"
    storage_account_name  = "tftemplatesmx"
    container_name        = "tftemplates"
    key                   = "your key here"
  }
}