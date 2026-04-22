locals {
  ssh_ip = {for k, v in yandex_compute_instance.vm_ubuntu : k=>{
    ip = v.network_interface[0].ip_address
    }}
}

resource "local_file" "ssh_config" {
  content = templatefile("${path.module}/templates/ssh_config.tpl", {
    bastion_ip    = var.lb_nat_ip[0]
    vms           = local.ssh_ip
    ssh_user      = var.vm_user
  })
    filename = "${path.module}/../../../ansible/ssh_config"
}