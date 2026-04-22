locals {
  vm_info = {
    for k, v in proxmox_virtual_environment_vm.ubuntu : k=>{
      ip = split("/", v.initialization[0].ip_config[0].ipv4[0].address)[0]
    }
  }
}

resource "local_file" "ansible_inventory" {
  content = templatefile("${path.module}/template/host.yml.tpl", {
    vms          = local.vm_info
    ansible_key  = var.private_path_ssh
    ansible_user = var.vm_user
  })
  filename = "${path.module}/../../../ansible/inventory/hosts.yaml"
}                
  
