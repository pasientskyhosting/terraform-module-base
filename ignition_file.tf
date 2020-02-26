# ------------------------------------------------------------------------------
# IGNITION FILES
# ------------------------------------------------------------------------------

data "ignition_file" "etc_hostname" {

    filesystem  = "root"
    path        = "/etc/hostname"
    mode        = 420

    content {
        content = var.hostname
        mime    = "text/plain"
    }

}

data "ignition_file" "profile_env" {

    filesystem  = "root"
    path        = "/etc/profile.env"
    mode        = 420

    content {
        content = <<EOT
export PATH=/home/core/bin:/opt/bin:$PATH
EOT
        mime    = "text/plain"
    }

}

data "ignition_file" "default_link_policy" {

    filesystem  = "root"
    path        = "/etc/systemd/network/99-default.link"
    mode        = 420

    content {
        content = <<EOF
[Link]
NamePolicy=slot mac kernel database
MACAddressPolicy=persistent
MTUBytes=${var.network_interface_mtu}
EOF
        mime    = "text/plain"
    }

}

data "ignition_file" "toolboxrc" {

  filesystem  = "root"
  path        = "/root/.toolboxrc"
  mode        = 420

  content {
    mime    = "text/plain"
    content = <<EOT
TOOLBOX_DOCKER_IMAGE=ubuntu
TOOLBOX_DOCKER_TAG=18.04
EOT

    }

}