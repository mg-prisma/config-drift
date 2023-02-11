## Application - Variables ##
# company name 
variable "company" {
  type = string
  description = "The company name used to build resources"
  default = "paloaltonetworks"
}
# application name 
variable "app_name" {
  type = string
  description = "The application name used to build resources"
  default = "app1"
}
# application or company environment
variable "environment" {
  type = string
  description = "The environment to be built"
  default = "development"
}
# azure region
variable "location" {
  type = string
  description = "Azure region where resources will be created"
  default = "westus"
}
## Network - Variables ##
variable "network-vnet-cidr" {
  type = string
  description = "The CIDR of the network VNET"
  default = "10.127.0.0/16"
}
variable "network-subnet-cidr" {
  type = string
  description = "The CIDR for the network subnet"
  default = "10.127.1.0/24"
}