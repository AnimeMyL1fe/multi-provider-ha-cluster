resource "yandex_compute_disk" "vm_disk" {
  for_each  = var.vm_configuration
  name      = each.value.disk_name
  type      = each.value.disk_type
  zone      = var.yandex_zone
  image_id  = data.yandex_compute_image.ubuntu_image.id
  size      = var.vms_profile[each.value.vm_profile].disk_size

  labels = {
    environment = "ubuntu-disk"
  }
}