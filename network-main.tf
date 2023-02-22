# Define Terraform provider
terraform {
  required_version = ">= 0.12"
}
# Configure the Azure provider
provider "azurerm" {
  environment = "public"
  version     = ">= 2.0.0"
  features {}
}
# Create a resource group for network
resource "azurerm_resource_group" "network-rg" {
  name     = "${var.app_name}-${var.environment}-rg"
  location = var.location
  tags = {
    application          = var.app_name
    environment          = var.environment
    git_commit           = "d0603a752d3af2cdfd07ba51d96f67d535d12258"
    git_file             = "network-main.tf"
    git_last_modified_at = "2023-02-11 00:44:29"
    git_last_modified_by = "mgraboski@paloaltonetworks.com"
    git_modifiers        = "mgraboski"
    git_org              = "mg-prisma"
    git_repo             = "config-drift"
    yor_trace            = "6b008797-3e9a-4612-ae5e-051c0d1b9277"
  }
}
# Create the network VNET
resource "azurerm_virtual_network" "network-vnet" {
  name                = "${var.app_name}-${var.environment}-vnet"
  address_space       = [var.network-vnet-cidr]
  resource_group_name = azurerm_resource_group.network-rg.name
  location            = azurerm_resource_group.network-rg.location
  tags = {
    application          = var.app_name
    environment          = var.environment
    git_commit           = "d0603a752d3af2cdfd07ba51d96f67d535d12258"
    git_file             = "network-main.tf"
    git_last_modified_at = "2023-02-11 00:44:29"
    git_last_modified_by = "mgraboski@paloaltonetworks.com"
    git_modifiers        = "mgraboski"
    git_org              = "mg-prisma"
    git_repo             = "config-drift"
    yor_trace            = "b9d41bfb-5cc9-45d1-ad35-f21ec2f9acf5"
  }
}
# Create a subnet for Network
resource "azurerm_subnet" "network-subnet" {
  name                 = "${var.app_name}-${var.environment}-subnet"
  address_prefixes     = [var.network-subnet-cidr]
  virtual_network_name = azurerm_virtual_network.network-vnet.name
  resource_group_name  = azurerm_resource_group.network-rg.name
}