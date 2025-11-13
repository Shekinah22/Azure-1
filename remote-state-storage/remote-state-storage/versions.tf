# Terraform Block
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 2.0" 
    }
    random = {
      source = "hashicorp/random"
      version = ">= 3.0"
    }
  }


 # Terraform State Storage to Azure Storage Container
  backend "azurerm" {
    resource_group_name   = "terraform-storage-rg"
    storage_account_name  = "terraformstate25"
    container_name        = "tfstatefiles"
    key                   = "terraform.tfstate"
  } 
} 


# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
  resource_provider_registrations = "all"
  subscription_id                 = ""
}

# Random String Resource
resource "random_string" "myrandom" {
  length = 6
  upper = false 
  special = false
  numeric = true  
}

