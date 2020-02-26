module "vm_host" {

  # Kamailio PSTN
  source                      = "../"
  hostname                    = "${var.datacenter}-vlb-test-001"
  datacenter                  = "${var.datacenter}"
  datastore_cluster           = "${var.datacenter}-data-s2"
  disks                       = [20]
  folder                      = "/"
  memory                      = 4096
  vcpus                       = 4
  resource_pool               = "${var.datacenter}/Resources"
  template_vm                 = "templates/flatcar_2303.4.0"
  vlan                        = ["vlan-601"]
  ignition_encoding           = "base64"
  adapter_type                = ["vmxnet3"]
  wait_for_guest_net_routable = false
  wait_for_guest_net_timeout  = 0
  thin_provisioned            = false
  eagerly_scrub               = true
  skip_customization          = true
  ip_address_prefix           = ["24"]
  ip_address                  = ["${var.ip_address}"]
  ip_address_gateway          = ["${var.ip_address_gateway}"]
  ip_address_familiy          = "ipv4"
  network_interface_mtu       = 1500
  dns_servers                 = ["1.1.1.1", "8.8.8.8", "8.8.4.4"]
  ssh_authorized_keys         = ["ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCjcbd8KEujzX8cieLbd6TBsRS2mOdGf1FuQNPC22Ucg/qn0/aG8UK3/ZAhMw2RhhVObr5G2gnTxzcmQwDpnZ2rEK3QA2MoYM1NBYFmkqUudZED4Kf/CxBCH51l42Dmux50GMxdNR0bkjSH1R1f8CQwrIpiDXYLncihlXvGZy0IzVGBvML5gIcrIW3LflJu/LyjY7IbvA6t5GCNCnuFV56wUcfhcGMHpyX1If8w5+/DLmTcAS3I0120yWLw3k/+rS/TProJzIbzn9sNaKvsk6dJQw1aOANKSPrZ28//uYhPsq3qTwfhuzYjLEezd+w4uJOF4rKE5/o1r4Y4a1mnCzLtVMSxwUR7tP0ljXztRGovBtbgfEEri8ONpRCWYdHpVqUCaozW+2uQKwoccgZ4SJl3uqx60Xrqao625Mxoc86EnfTlq7N91mJJ3Nc33z+emKRrnE7P0Eh1k/RAW85AXIUDJbt5Fc20ATRiTOVLGpJTkrAphm+JHcaoo+YKzypR3r6upwsJVX1yXa8kBoSGbouAghAuRKx/IgEodSolIKDnq8KagJmBwXG9ussJpYHW607ZEMzNwwsFFEMQxyLzrVDznPNk4C88tyzpnI9Yli54KUGNehFIn0RVyN015T3KpxHVP+iciwBTo7DtDRZyjI8dfbaG3fePVok4K5B4lOVg2w== cardno:000606708586"]
  sshd_port                   = 34

  providers = {
    vsphere = vsphere.default
  }

}

provider "vsphere" {
  user                 = var.provider_vsphere_default__user
  password             = var.provider_vsphere_default__password
  vsphere_server       = var.provider_vsphere_default__server
  alias                = "default"
  allow_unverified_ssl = true
}

variable "provider_vsphere_default__user" {
  type = string
}
variable "provider_vsphere_default__password" {
  type = string
}
variable "provider_vsphere_default__server" {
  type = string
}

variable "datacenter" {
  type = string
}

variable "ip_address" {
  type = string
}

variable "ip_address_gateway" {
  type = string
}

output "ignition_config" {
  value = module.vm_host.ignition_config
}