# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

module "locks" {
  source = "../Microsoft.Authorization/locks"
  count  = var.enable_resource_lock ? 1 : 0
  name   = "${azurerm_key_vault.key_vault.name}-${var.lock_level}-lock"
  scope_id   = azurerm_key_vault.key_vault.id
  lock_level = var.lock_level
}
