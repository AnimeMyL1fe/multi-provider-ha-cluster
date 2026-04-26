locals {
  vm_ip = {
    for k, v in yandex_compute_instance.vm_ubuntu : k=>{
    private_ip = v.network_interface[0].ip_address
    public_ip  = v.network_interface[0].nat_ip_address
  }}
  # mwdb_ip = {
  #   for k,v in yandex_compute_instance.vm_ubuntu : k=> v.network_interface[0].ip_address
  #   if var.vm_configuration[k].vm_profile == "mw_db"
  # }
  # zbxdb_ip = {
  #   for k, v in yandex_compute_instance.vm_ubuntu : k=> v.network_interface[0].ip_address
  #   if var.vm_configuration[k].vm_profile == "zbx_db"
  # }
}

resource "local_file" "ansible_inventory" {
  content = templatefile("${path.module}/templates/hosts.yaml.tpl", {
    
    vms                 = local.vm_ip
    ans_user            = var.vm_user
    ans_ssh_key         = var.private_path_ssh
<<<<<<< HEAD:dev/terraform_yandex/modules_yandex/yandex_instances/inventory.tf
    #mw_db_internal_ip   = yandex_compute_instance.vm_ubuntu["mw-postgresql-1"].network_interface[0].ip_address

    # для yc balancer
    # lb_name1            = "lb-1"
    # lb_name2            = "lb-2"
    # lb_ip1              = var.lb_ip[0]
    # lb_ip2              = var.lb_ip[1]
    
=======
    mw_db_ips           = yandex_compute_instance.vm_ubuntu["mw-db1"].network_interface[0].ip_address
 #   zbx_db_internal_ip  = local.zbxdb_ip
>>>>>>> main:dev/terrraform/modules_yandex/yandex_instances/inventory.tf
  })
  filename = "${path.module}/../../../ansible/inventory/hosts.yaml"
}