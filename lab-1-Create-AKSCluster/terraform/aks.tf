resource "azurerm_resource_group" "k8srg" {
  name     = "k8s_Zone"
  location = "East US"
}

resource "azurerm_kubernetes_cluster" "k8s" {
  name                = "AKSCluterMX01"
  location            = azurerm_resource_group.k8srg.location
  resource_group_name = azurerm_resource_group.k8srg.name
  dns_prefix          = "k8smx"

  linux_profile {
    admin_username = "ubuntu"

    ssh_key {
            key_data = file(var.ssh_public_key)
        }
  }

  default_node_pool {
        name            = "agentpool1"
        node_count      = 1
        vm_size         = "Standard_DS2_v2"
        
        enable_auto_scaling = true
        type = "VirtualMachineScaleSets"
        max_count = "2"
        min_count = "1"
    }

  tags = {
    Environment = "AKSLab"
  }

service_principal {
    client_id     = "e89dfabc-6888-4a42-b14e-ff27b2ec36ae"
    client_secret = "fd85da7c-578c-48c8-83e3-f23a726fea4c"
  }

}