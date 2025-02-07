# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

# This module deploys a bastion host to the specified resource group.
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/bastion_host

#############################################
# DATA                                      #
#############################################
data "azurerm_resource_group" "hub" {
  name = var.resource_group_name
}

data "azurerm_virtual_network" "hub_bastion_host_vnet" {
  name                = var.virtual_network_name
  resource_group_name = data.azurerm_resource_group.hub.name
}

################################################
# RESOURCES                                    #
################################################
resource "azurerm_bastion_host" "bastion_host" { # Bastion Host
  depends_on = [
    module.mod_bastion_host_pip
  ]
  name                = var.bastion_host_name
  location            = var.location
  resource_group_name = data.azurerm_resource_group.hub.name
  sku                 = var.bastion_host_sku_name

  ip_configuration {
    name                 = var.ipconfig_name
    subnet_id            = var.subnet_id
    public_ip_address_id = module.mod_bastion_host_pip.id
  }

  tags = merge(var.tags, {
    DeployedBy = format("AzureNoOpsTF [%s]", terraform.workspace)
  })
}

################################################
# MODULES                                      #
################################################
// Setup Public IP for Bastion Host
module "mod_bastion_host_pip" { # Public IP for Bastion Host
  source = "../publicIPAddress"

  // Global Settings
  location = var.location

  // Public IP Parameters
  public_ip_address_name              = var.public_ip_address_name
  resource_group_name                 = data.azurerm_resource_group.hub.name
  public_ip_address_sku_name          = var.public_ip_address_sku_name
  public_ip_address_allocation        = var.public_ip_address_allocation  


  // Public IP Tags
  tags = merge(var.tags, {
    DeployedBy  = format("AzureNoOpsTF [%s]", terraform.workspace)
    description = format("Public IP address for Azure Bastion %s", var.bastion_host_name)
  })
}

// Setup Key Vault Access for Bastion Host




