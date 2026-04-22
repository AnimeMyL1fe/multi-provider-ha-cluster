resource "yandex_lb_network_load_balancer" "yc_balancer" {
  name = var.yc_balancer.name #"yc-balancer-1"
  listener {
    name = var.yc_balancer.listener #"ycb-listener"
    port = var.yc_balancer.listener_port
  }
  attached_target_group {
    target_group_id = "${yandex_compute_instance_group.lb_group.load_balancer.0.target_group_id}"
    healthcheck {
      name                = var.yc_balancer.healthcheck
      unhealthy_threshold = var.yc_balancer.unhealthy
      healthy_threshold   = var.yc_balancer.healthy
      http_options {
        port = var.yc_balancer.http_port
      }
    }
  }
}
