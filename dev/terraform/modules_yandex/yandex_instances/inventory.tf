locals {
  vm_ip = {for k, v in yandex_compute_instance.vm_ubuntu : k=>{
    private_ip = v.network_interface[0].ip_address
    public_ip  = v.network_interface[0].nat_ip_address
  }}
}

resource "local_file" "ansible_inventory" {
  content = templatefile("${path.module}/templates/hosts.yaml.tpl", {
    
    vms                 = local.vm_ip
    ans_user            = var.vm_user
    ans_ssh_key         = var.private_path_ssh
    mw_db_internal_ip   = yandex_compute_instance.vm_ubuntu["mw-postgresql-1"].network_interface[0].ip_address
    lb_name1            = "lb-1"
    lb_name2            = "lb-2"
    lb_nat_ip1          = var.lb_nat_ip[0]
    lb_nat_ip2          = var.lb_nat_ip[1]
    lb_ip1              = var.lb_ip[0]
    lb_ip2              = var.lb_ip[1]
    
  })
  filename = "${path.module}/../../../ansible/inventory/hosts.yaml"
}