# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

module "locks" {
  source = "../Microsoft.Authorization/locks"
  count  = var.enable_resource_locks ? 1 : 0

  name   = "${azurerm_storage_account.main.name}-${var.lock_level}-lock"
  scope_id   = azurerm_storage_account.main.id
  lock_level = var.lock_level
}
