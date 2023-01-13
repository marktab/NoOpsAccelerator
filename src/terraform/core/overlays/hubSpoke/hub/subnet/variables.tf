# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

variable "location" {
  description = "The location/region to keep all your network resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table'"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the subnet's resource group"
  type        = string
}

variable "virtual_network_name" {
  description = "The name of the subnet's virtual network"
  type        = string
}

variable "hub_subnets" {
  description = "A complex object that describes subnets for the spoke network"
  type = list(object({
    name              = string
    address_prefixes  = list(string)
    service_endpoints = list(string)

    enforce_private_link_endpoint_network_policies = bool
    enforce_private_link_service_network_policies  = bool
  }))
}

variable "network_security_group_name" {
  description = "The name of the subnet's virtual network"
  type        = string
}

variable "network_security_group_rules" {
  description = "A map of network security group rules to add to the network security group."
  type = map(object({
    name                       = string
    priority                   = string
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = list(string)
    source_address_prefix      = list(string)
    destination_address_prefix = string
  }))
  default = {}
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
}

variable "routetable_name" {
  description = "The name of the subnet's route table"
  type        = string
}

variable "firewall_private_ip_address" {
  description = "The IP Address of the Firewall"
  type        = string
}

