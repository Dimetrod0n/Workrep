provider "azurerm" {
    subscription_id = "01d76bd6-326c-4ba2-ba01-c32a9a2d3630"
    client_id       = "c7703e3b-9001-461a-93a3-a696835b3026"
    client_secret   = "b00894d2-c82d-467a-9eae-70e211882bfe"
    tenant_id       = "756b2b5d-5add-4dc9-8be2-bfa1b1654864"
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
