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
  description = "(Required) The name of the virtual network"
  type        = string
  default = ""
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
}

variable "network_interface_name" {
  description = "The name of the network interface the virtual machine resides in"
  type        = string
}

variable "network_security_group_name" {
  description = "The name of the network security group the virtual machine resides in"
  type        = string
  default = ""
}

variable "ip_configuration_name" {
  description = "The name of the ip configuration the virtual machine resides in"
  type        = string
}

variable subnet_id {
  description = "(Required) Specifies the resource id of the subnet hosting the virtual machine"
  type        = string
}

variable "public_ip_address_id" {
  description = "The id of the public ip address. Defaults to \"\"."
  type        = string
  default = ""
}

variable "private_ip_address_allocation" {
  description = "The private ip address allocation. Possible values are Static and Dynamic. Defaults to Dynamic."
  type        = string
  default = "Dynamic"
}

variable "enable_accelerated_networking" {
  description = "Enable accelerated networking on this network interface"
  type        = bool
  default     = false
}

