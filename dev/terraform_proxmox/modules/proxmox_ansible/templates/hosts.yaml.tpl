dev:
  children: 
    # --- WEB SERVERS ---
    web_servers: 
      hosts: 
%{for name, vm in vms ~}
%{ if length(regexall("mw-web", name)) > 0 ~}
        ${name}:
          ansible_host: ${vm.ip}
%{ endif ~}
%{ endfor ~}

    # --- MW_DB_MASTER SERVERS --- 
    mwdb_servers_master:
      hosts:
%{for name, vm in vms ~}
%{ if length(regexall("mw-db-master", name)) > 0 ~}
        ${name}:
          ansible_host: ${vm._ip}
%{ endif ~}
%{ endfor ~}

    # --- MW_DB_CLUSTERR SERVERS --- 
    mwdb_postgresql_servers:
      hosts:
%{for name, vm in vms ~}
%{ if length(regexall("mw-postgresql", name)) > 0 ~}
        ${name}:
          ansible_host: ${vm.ip}
%{ endif ~}
%{ endfor ~}

    # --- MW_DB_REPLICA SERVERS --- 
    mwdb_servers_replica:
      hosts:
%{for name, vm in vms ~}
%{ if length(regexall("mw-db-replica", name)) > 0 ~}
        ${name}:
          ansible_host: ${vm.ip}
%{ endif ~}
%{ endfor ~}

      # --- ETCD SERVERS ---
    etcd_servers:
%{for name, vm in vms ~}
%{ if length(regexall("etcd", name)) > 0 ~}
      hosts:
        ${name}:
          ansible_host: ${vm.ip}
%{ endif ~}
%{ endfor ~}

    # --- LB SERVERS --- 
%{for name, vm in vms ~}
%{ if length(regexall("lb", name)) > 0 ~}
    lb_servers:
      hosts:
        ${lb_name1}:
          ansible_host: ${vm.ip1} 
        ${lb_name2}:
          ansible_host: ${vm.ip2} 
%{ endif ~}
%{ endfor ~}
  
    # --- HAPROXY SERVERS ---
    haproxy_servers:
%{for name, vm in vms ~}
%{ if length(regexall("haproxy", name)) > 0 ~}
      hosts:
        ${name}:
          ansible_host: ${vm.ip}
%{ endif ~}
%{ endfor ~}


      # --- ZBX SERVERS ---
    zbx_servers:
%{for name, vm in vms ~}
%{ if length(regexall("zbx", name)) > 0 ~}
      hosts:
        ${name}:
          ansible_host: ${vm.ip}
%{ endif ~}
%{ endfor ~}

  vars:
    ansible_user: ${ans_user}
    ansible_ssh_private_key_file: ${ansible_key} 
    connection_protocol: ssh
    ansible_become: true 
