
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

# Give execute privilege
resource "azurerm" "privs" {
  provisioner "local-exec" {
    command = "chmod +x /home/dmitry/WorkDir/azvmcreate.txt"
    command = "chmod +x /home/dmitry/WorkDir/cloud-init-jenkins.txt"
    command = "chmod +x /home/dmitry/WorkDir/run.tf"
    command = "chmod +x /home/dmitry/WorkDir/open_ports.txt"
  }
}

#Create resource group
resource "azurerm" "group" {
resource "azurerm_resource_group" "myterraformgroup" {
    name     = "DmitrysGroup"
    location = "eastus"
 }
}

#Create VM
resource "azurerm" "VM" {
  provisioner "local-exec" {
    command = "./azvmcreate.txt"
   }
  }

#Open ports
resource "azurerm" "ports" {
  provisioner "local-exec" {
    command = "./open_ports.txt"
   }
  }
