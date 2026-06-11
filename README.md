```
dev
├── ansible
│   │   ├── group_vars
│   │   ├── all
│   │   ├── etcd_servers
│   │   ├── lb_servers
│   │   ├── mwdb_postgresql_servers
│   │   ├── mwdb_servers
│   │   ├── web_servers
│   │   └── zbx_servers
│   ├── inventory
│   └── roles
│       ├── bootstrap
│       ├── final_check
│       ├── lb_hapoxy
│       ├── lb_nginx
│       ├── mw_nginx
│       ├── mw_web
│       ├── mwdb_backup
│       ├── mwdb_etcd_cluster
│       ├── mwdb_patroni
│       ├── mwdb_postgresql
│       ├── web_backup
│       ├── web_mediawiki
│       ├── web_nginx
│       ├── web_packages
│       ├── zbx_agent2
│       └── zbx_server
├── terraform_proxmox
│   └── modules
│       ├── proxmox_ansible
│       ├── proxmox_instance
│       └── proxmox_network
├── terraform_yandex
│   └── modules_yandex
│       ├── yandex_balancer
│       ├── yandex_instances
│       └── yandex_networks
└── terrraform
    └── modules_yandex
        └── yandex_instances
```
