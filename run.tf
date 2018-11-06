provider "azurerm" {
    subscription_id = ""
    client_id       = ""
    client_secret   = ""
    tenant_id       = ""
}

# Copies files to WorkDir
  provisioner "file" {
    source      = "/home/dmitry/WorkDir/Workrep/Dockerfile"
    destination = "/home/dmitry/WorkDir/Dockerfile"
  }

  provisioner "file" {
    source      = "/home/dmitry/WorkDir/Workrep/cloud-init-jenkins.txt"
    destination = "/home/dmitry/WorkDir/cloud-init-jenkins.txt"
  }

  provisioner "file" {
    source      = "/home/dmitry/WorkDir/Workrep/azvmcreate.txt"
    destination = "/home/dmitry/WorkDir/azvmcreate.txt"
  }

  provisioner "file" {
    source      = "/home/dmitry/WorkDir/Workrep/open_ports.txt"
    destination = "/home/dmitry/WorkDir/open_ports.txt"
  }


# Give execute privilege
  provisioner "local-exec" {
    command = "chmod +x /home/dmitry/WorkDir/azvmcreate.txt",
	      "chmod +x /home/dmitry/WorkDir/cloud-init-jenkins.txt",
	      "chmod +x /home/dmitry/WorkDir/Dockerfile",
	      "chmod +x /home/dmitry/WorkDir/open_ports.txt"
  }


#Create resource group
resource "azurerm_resource_group" "myterraformgroup" {
    name     = "DmitrysGroup"
    location = "eastus"
}

#Create VM
  provisioner "local-exec" {
    command = "./azvmcreate.txt"
  }

#Open ports
  provisioner "local-exec" {
    command = "./open_ports.txt"
  }
