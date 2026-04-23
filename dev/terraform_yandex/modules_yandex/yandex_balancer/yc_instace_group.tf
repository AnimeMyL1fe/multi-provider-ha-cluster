resource "yandex_compute_instance_group" "lb_group" {
  name                = var.lb_group.name
  folder_id           = var.lb_group.folder_id
  service_account_id  = var.lb_group.service_id
  instance_template {
    platform_id = var.lb_group.platform_id
    resources {
      memory = var.lb_group_profile.ram
      cores  = var.lb_group_profile.cores
    }
    boot_disk {
      mode = "READ_WRITE"
      initialize_params {
        image_id = data.yandex_compute_image.ubuntu_image.id
        size     = var.lb_group_profile.disk_size
      }
    }
    network_interface {
      network_id = var.network_id
      security_group_ids  = [var.security_group_id]
      subnet_ids = [var.subnet_id]
      nat        = false
    }

    metadata = {
      ssh-keys = "${var.vm_user}:${file("${var.path_ssh}")}"
    }

    network_settings {
      type = "STANDARD"
    }
  }

  scale_policy {
    fixed_scale {
      size = var.lb_group.fixed_scale
    }
  }

  allocation_policy {
    zones = [var.yc_region]
  }

  deploy_policy {
    max_unavailable = 1
    max_expansion   = 0
  }
  load_balancer {
    target_group_name = var.lb_group.group_name
  }
}