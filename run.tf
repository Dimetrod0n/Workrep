
variable "subscription_id" {}
variable "tenant_id" {}
variable "client_id" {}
variable "client_secret" {}

provider "azurerm" {
    subscription_id = "${var.subscription_id}"
    tenant_id = "${var.tenant_id}"
    client_id = "${var.client_id}"
    client_secret = "${var.client_secret}"
}

#Create resource group
resource "azurerm_resource_group" "myterraformgroup" {
    name     = "DmitrysGroup"
    location = "eastus"
 }


#Create VM
resource "azurerm_resource_group" "VM" {
  name     = "DmitrysGroup"
  location = "eastus"
  provisioner "local-exec" {
    command = "./azvmcreate.txt"
   }
  }

#Open ports
resource "azurerm_resource_group" "ports" {
  name     = "DmitrysGroup"
  location = "eastus"
  provisioner "local-exec" {
    command = [
        "./open_Jenkins_port.txt",
        "./open_nodejs_port.txt"
      ]
   }
  }
