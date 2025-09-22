
resource "random_integer" "ran_num" {
  min = 1
  max = 69999
}

resource "random_string" "ran_str" {
  length = 5
  upper = false
  special = false
}

// resource group
resource "azurerm_resource_group" "static_rg" {
  name = "static_rg"
  location = "westeurope"
}

resource "azurerm_static_web_app" "test_site" {
  name = "test-site"
  location = "westeurope"
  resource_group_name = azurerm_resource_group.static_rg.name
  sku_size = "Standard"
  sku_tier = "Standard"

}

// Srorage account can only consist of lowercase letters and numbers, and must be between 3 and 24 characters long and be globally unique

resource "azurerm_storage_account" "staic_site_storage" {
  name = "storagesite${random_string.ran_str.result}"
  location = azurerm_resource_group.static_rg.location
  account_replication_type = "LRS"
  account_tier = "Standard"
  resource_group_name = azurerm_resource_group.static_rg.name
}


resource "azurerm_service_plan" "static_service" {
  name                = "static_servic"
  location            = "westeurope"
  resource_group_name = azurerm_resource_group.static_rg.name
  os_type             = "Linux"
  sku_name            = "S1"

}

// function app must be globally unique

resource "azurerm_linux_function_app" "func" {
  name                =  "func${random_string.ran_str.result}"
  location            = azurerm_resource_group.static_rg.location
  resource_group_name = azurerm_resource_group.static_rg.name
  service_plan_id     = azurerm_service_plan.static_service.id
  storage_account_name       = azurerm_storage_account.staic_site_storage.name
  storage_account_access_key = azurerm_storage_account.staic_site_storage.primary_access_key
  

  site_config { 
    minimum_tls_version = "1.2"
  }

  lifecycle {
    ignore_changes = [auth_settings_v2]
  }
}

resource "azurerm_static_web_app_function_app_registration" "function_reg" {
    
  static_web_app_id = azurerm_static_web_app.test_site.id
  function_app_id   = azurerm_linux_function_app.func.id
}