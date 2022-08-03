provider "azurerm" {
    version = "~>2.0"
    features {}
}

terraform {
  backend "azurerm" {
    resource_group_name   = "terraformrg"
    storage_account_name  = "tftemplatesmx"
    container_name        = "tftemplates"
    key                   = "yKQVLFlPgf38oImxZ3SsQGPT2DZKX8G5PS3+QWNJD5NwVPl0wKFHhW6fANLyTvPSjmJsq7a/XNpIVaJTRe16RA=="
  }
}