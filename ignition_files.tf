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