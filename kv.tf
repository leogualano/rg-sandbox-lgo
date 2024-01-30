resource "azurerm_key_vault" "kv" {
  name                       = "lgokv"
  location                   = azurerm_resource_group.rg.location
  resource_group_name        = azurerm_resource_group.rg.name
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  sku_name                   = var.sku_name
  soft_delete_retention_days = 7

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Create",
      "Get"
    ]
  }
}

# Create a key.
resource "azurerm_key_vault_key" "key" {
  name         = "myKey"
  key_vault_id = azurerm_key_vault.kv.id
  key_type     = "RSA"
  key_size     = 4096

  key_opts = [
    "decrypt",
    "encrypt",
    "sign",
    "verify",
    "unwrapKey",
    "wrapKey"
  ]
}

# Expose the created key's ID through the terraform state
output "key_id" {
  value       = azurerm_key_vault_key.key.id
  description = "The id of the generated azure key vault key."
}