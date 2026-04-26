resource "yandex_compute_instance" "vm_ubuntu" {
  for_each    = var.vm_configuration
  name        = each.value.vm_name
  platform_id = var.vms_profile[each.value.vm_profile].platform_id
  zone        = var.yandex_zone

  resources {
    core_fraction = var.vms_profile[each.value.vm_profile].core_fraction
    cores         = var.vms_profile[each.value.vm_profile].cores
    memory        = var.vms_profile[each.value.vm_profile].memory
  }

  boot_disk {
    disk_id = yandex_compute_disk.vm_disk[each.key].id
  }

  network_interface {
    index               = 1
    subnet_id           = var.subnet_id
    security_group_ids  = [var.security_group_id]
    nat                 = (each.key == "nginx-lb")
    nat_ip_address      = (each.key == "nginx-lb") ? data.yandex_vpc_address.bastion.external_ipv4_address[0].address : null 
  }

  metadata = {
    ssh-keys = "${var.vm_user}:${file("${var.path_ssh}")}"
  }
}