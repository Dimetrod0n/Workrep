
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

# Give execute privilege
resource "azurerm_resource_group" "privs" {
  name     = "DmitrysGroup"
  location = "eastus"
  provisioner "local-exec" {
    command = "sudo chmod +x /home/dmitry/WorkDir/Workrep/azvmcreate.txt"
    command = "sudo chmod +x /home/dmitry/WorkDir/Workrep/cloud-init-jenkins.txt"
    command = "sudo chmod +x /home/dmitry/WorkDir/Workrep/open_Jenkins_port.txt"
    command = "sudo chmod +x /home/dmitry/WorkDir/Workrep/open_nodejs_port.txt"
  }
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
    command = "./open_Jenkins_port.txt"
    command = "./open_nodejs_port.txt"
   }
  }
