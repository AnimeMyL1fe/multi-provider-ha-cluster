output "vm_ipv4" {
  value = { for k, v in proxmox_virtual_environment_vm.ubuntu_vm : k=>{
      ip = v.initialization[0].ip_config[0].ipv4[0].address
    }
  }
}