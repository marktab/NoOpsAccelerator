#################################
# Global Configuration
#################################

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "virtual_network_name" {
  description = "The name of the virtual network."
  type        = string
  default     = "hub-vnet"
}

variable "tags" {
  description = "A map of key value pairs to apply as tags to resources provisioned in this deployment"
  type        = map(string)
  default     = {}
}

variable "org_prefix" {
  description = "A name for the organization. It defaults to anoa."
  type        = string
}

variable "location" {
  description = ""
  type        = string
}

variable "deploy_environment" {
  description = "The environment to deploy to. It defaults to 'dev'."
  type        = string
  default     = "dev"
}

#################################
# Firewall configuration section
#################################

variable "enable_firewall" {
  description = "Enable Azure Firewall deployment. It defaults to true."
  type        = bool
  default     = true
}

variable "firewall_name" {
  description = "The name of the Azure Firewall."
  type        = string
  default     = "hub-firewall"
}

variable "firewall_policy_name" {
  description = "The name of the Azure Firewall Policy."
  type        = string
  default     = "hub-firewall-policy"
}

variable "firewall_client_public_ip_address_name" {
  description = "The name of the Azure Firewall Client Public IP Address."
  type        = string
  default     = ""
}

variable "firewall_management_public_ip_address_name" {
  description = "The name of the Azure Firewall Management Public IP Address."
  type        = string
  default     = ""
}

variable "firewall_client_subnet_address_prefix" {
  description = "The CIDR Subnet Address Prefix for the Azure Firewall Subnet. It must be in the Hub Virtual Network space. It must be /26."
  type        = string
  default     = "10.0.100.0/26"
}

variable "firewall_management_subnet_address_prefix" {
  description = "The CIDR Subnet Address Prefix for the Azure Firewall Management Subnet. It must be in the Hub Virtual Network space. It must be /26."
  type        = string
  default     = "10.0.100.64/26"
}

variable "enable_forced_tunneling" {
  description = "Route all Internet-bound traffic to a designated next hop instead of going directly to the Internet"
  type        = bool
  default     = false
}

variable "firewall_sku_tier" {
  description = "[Standard/Premium] The SKU for Azure Firewall. It defaults to Premium."
  type        = string
  default     = "Premium"
}

variable "firewall_sku_name" {
  description = "SKU name of the Firewall. Possible values are AZFW_Hub and AZFW_VNet."
  type        = string
  default     = "AZFW_VNet"
}

variable "firewall_threat_intel_mode" {
  description = "[Alert/Deny/Off] The Azure Firewall Threat Intelligence Rule triggered logging behavior. Valid values are 'Alert', 'Deny', or 'Off'. The default value is 'Alert'"
  type        = string
  default     = "Alert"
}

variable "firewall_diagnostics_logs" {
  description = "An array of Firewall Diagnostic Logs categories to collect. See 'https://docs.microsoft.com/en-us/azure/firewall/firewall-diagnostics#enable-diagnostic-logging-through-the-azure-portal' for valid values."
  type        = list(string)
  default     = ["AzureFirewallApplicationRule", "AzureFirewallNetworkRule", "AzureFirewallDnsProxy"]
}

variable "firewall_diagnostics_metrics" {
  description = "An array of Firewall Diagnostic Metrics categories to collect. See 'https://docs.microsoft.com/en-us/azure/firewall/firewall-diagnostics#enable-diagnostic-logging-through-the-azure-portal' for valid values."
  type        = list(string)
  default     = ["AllMetrics"]
}

variable "firewall_client_subnet_service_endpoints" {
  description = "An array of Service Endpoints to enable for the Azure Firewall Client Subnet. See https://docs.microsoft.com/en-us/azure/virtual-network/virtual-network-service-endpoints-overview for valid settings."
  type        = list(string)
  default = [
    "Microsoft.KeyVault",    
    "Microsoft.Sql",
    "Microsoft.Storage",
  ]
}

variable "firewall_management_subnet_service_endpoints" {
  description = "An array of Service Endpoints to enable for the Azure Firewall Management Subnet. See https://docs.microsoft.com/en-us/azure/virtual-network/virtual-network-service-endpoints-overview for valid settings."
  type        = list(string)
  default     = []
}

variable "firewall_supernet_IP_address" {
  description = "Name of the firewall policy to apply to the hub firewall"
  type        = string
  default     = "10.0.96.0/19"
}

variable "publicIP_address_diagnostics_logs" {
  description = "An array of Public IP Address Diagnostic Logs for the Azure Firewall. See https://docs.microsoft.com/en-us/azure/ddos-protection/diagnostic-logging?tabs=DDoSProtectionNotifications#configure-ddos-diagnostic-logs for valid settings."
  type        = list(string)
  default     = []
}

variable "publicIP_address_diagnostics_metrics" {
  description = "An array of Public IP Address Diagnostic Metrics for the Azure Firewall. See https://docs.microsoft.com/en-us/azure/ddos-protection/diagnostic-logging?tabs=DDoSProtectionNotifications#configure-ddos-diagnostic-logs for valid settings."
  type        = list(string)
  default     = ["AllMetrics"]
}

variable "client_ipconfig_name" {
  description = "The name of the Firewall Client IP Configuration"
  type        = string
  default     = "firewall-client-ip-config"
}

variable "management_ipconfig_name" {
  description = "The name of the Firewall Management IP Configuration"
  type        = string
  default     = "firewall-management-ip-config"
}

variable "enable_resource_locks" {
  description = "Flag to enable locks on the operations resources"
  type        = bool
  default     = true
}

variable "lock_level" {
  description = "The level of lock to apply to the resources. Valid values are CanNotDelete, ReadOnly, or NotSpecified."
  type        = string
  default     = "CanNotDelete"
}

#################################
# Logging Configuration
#################################

variable "enable_diagnostics" {
  description = "Enable diagnostics for Azure Firewall"
  type        = bool
  default     = false
}

variable "log_analytics_resource_id" {
  description = "The name of the log analytics workspace resource id"
  type        = string
  default     = ""
}

variable "log_analytics_workspace_id" {
  description = "The name of the log analytics workspace"
  type        = string
  default     = ""
}

variable "log_analytics_storage_id" {
  description = "The name of the log analytics storage account"
  type        = string
  default     = ""
}
