#Open Jenkins port
resource "azurerm_resource_group" "Jenkinsport" {
  name     = "DmitrysGroup"
  location = "eastus"
  provisioner "local-exec" {
    command = "./open_Jenkins_port.txt"
   }
  }

#Open Node.js port
resource "azurerm_resource_group" "Nodejsport" {
  name     = "DmitrysGroup"
  location = "eastus"
  provisioner "local-exec" {
    command = "./open_nodejs_port.txt"
   }
  }