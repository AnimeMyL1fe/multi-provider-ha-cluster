data "yandex_compute_image" "ubuntu_image" {
    family = "ubuntu-2204-lts"
}
data "yandex_vpc_address" "bastion" {
  address_id = var.bastion_staitc_ip
}