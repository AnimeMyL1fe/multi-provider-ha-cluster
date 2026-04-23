data "yandex_compute_image" "ubuntu_image" {
    family = "ubuntu-2204-lts"
}
data "yandex_vpc_address" "balancer_static_ip" {
  address_id = var.balancer_ip
}
