resource "proxmox_virtual_environment_vm" "ubuntu_vm" {
  for_each      = var.configuration_vm
  name          = each.key
  description   = "CREATE INSTANCES"
  tags          = each.value.tags

  node_name = each.value.node
  vm_id     = each.value.id
 
  clone {
    vm_id = 150
  }

  stop_on_destroy = true


  cpu {
    cores    = var.profile_conf[each.value.profile].cpu
  }

  memory {
    dedicated = var.profile_conf[each.value.profile].ram
  }

  disk {
    datastore_id = "local-lvm"
    interface    = "scsi0"
    size         = var.profile_conf[each.value.profile].disk_size
  }

  network_device {
    bridge = var.network_conf[each.value.role].vnet
  }

  initialization {
    ip_config {
      ipv4 {
        address = "${each.value.address}/24"
        gateway = var.network_conf[each.value.role].gateway
      }
    }
    user_account {
      keys     = [file(pathexpand(var.path_ssh))]
      username = var.vm_user
    }
    }
}