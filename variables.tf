variable "storage_account_name" {
  type = string
  description = "Name of storage account"
  validation {
    condition = lower(var.storage_account_name) == var.storage_account_name
    error_message = "Storage account muct be lower case"
  }
}

variable "location" {
  type = string
  default = "westeurope"
}

