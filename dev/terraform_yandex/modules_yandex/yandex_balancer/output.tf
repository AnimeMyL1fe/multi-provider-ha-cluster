output "lb_nat_ip" {
    value =  [for inst in yandex_compute_instance_group.lb_group.instances :
    inst.network_interface[0].nat_ip_address
    ]
}
output "lb_ip" {
    value =  [for inst in yandex_compute_instance_group.lb_group.instances :
    inst.network_interface[0].ip_address
    ] 
}
