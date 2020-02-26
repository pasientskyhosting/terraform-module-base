# ------------------------------------------------------------------------------
# IGNITION SYSTEM
# ------------------------------------------------------------------------------

data "ignition_systemd_unit" "sshd_socket" {

    name    = "sshd.socket"
    enabled = true

    dropin {
      name = "10-sshd-port.conf"
      content = <<EOF
[Unit]
Description=OpenSSH Server Socket
Conflicts=sshd.service

[Socket]
ListenStream=
ListenStream=${var.sshd_port}
FreeBind=true
Accept=yes

[Install]
WantedBy=sockets.target
EOF
    }

}

data "ignition_systemd_unit" "vmtoolsd_service" {

    name    = "vmtoolsd.service"
    enabled = true
    content = <<EOT
[Unit]
Description=VMware Tools Agent
Documentation=https://github.com/vmware/open-vm-tools
ConditionVirtualization=vmware

[Service]
ExecStartPre=/usr/bin/ln -sfT /usr/share/oem/vmware-tools /etc/vmware-tools
ExecStart=/usr/share/oem/bin/vmtoolsd
TimeoutStopSec=10
TimeoutStartSec=10
PrivateTmp=true
Restart=always

[Install]
WantedBy=multi-user.target
EOT

}

data "ignition_systemd_unit" "var_lib_docker" {

    name    = "var-lib-docker.mount"
    enabled = true
    content = <<EOT
[Unit]
Description=Mount /var/lib/docker
Before=local-fs.target

[Mount]
What=/dev/sdb
Where=/var/lib/docker
Type=xfs

[Install]
WantedBy=local-fs.target
EOT

}

data "ignition_systemd_unit" "docker_service" {

    name    = "docker.service"
    enabled = true

    dropin {
      name = "10-wait-docker.conf"
      content = <<EOT
[Unit]
After=var-lib-docker.mount
Requires=var-lib-docker.mount
EOT
    }

}

data "ignition_systemd_unit" "update_engine_service" {

    name    = "update-engine.service"
    enabled = false
    mask    = true
}

data "ignition_systemd_unit" "locksmithd_service" {

    name    = "locksmithd.service"
    enabled = false
    mask    = true

}

data "ignition_systemd_unit" "python_pip_service" {

    name    = "python-pip.service"
    enabled = true
    content = <<EOT
[Unit]
After=net-check.service
Requires=net-check.service
[Service]
ExecStart=/usr/bin/bash /opt/bootstrap_python.sh
Type=oneshot

[Install]
WantedBy=multi-user.target
EOT

}

data "ignition_systemd_unit" "net_check_service" {

    name    = "net-check.service"
    enabled = true
    content = <<EOT
[Unit]
Description=Install net dependencies
Wants=network-online.target
After=network-online.target

[Service]
ExecStartPre=/bin/sh -c 'until ping -c1 8.8.8.8; do sleep 1; done;'
Type=oneshot
EOT

}
