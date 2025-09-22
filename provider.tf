
terraform {
    required_providers {
       azurerm = {
      source = "hashicorp/azurerm"
        version = "4.0.0"
       // version = "4.40.0"
    }

    random = {
      source = "hashicorp/random"
      version = "3.7.2"
    }

    }
  
}

provider "azurerm" {
    
  features {
    resource_group {
       prevent_deletion_if_contains_resources = false
    }
  }
}

provider "random" {

  
}