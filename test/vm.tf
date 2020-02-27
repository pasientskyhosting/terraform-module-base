module "vm_host" {

  source = "/module"

  adapter_type                = var.adapter_type
  datacenter                  = var.datacenter
  datastore_cluster           = var.datastore_cluster
  disks                       = var.disks
  dns_servers                 = var.dns_servers
  eagerly_scrub               = var.eagerly_scrub
  folder                      = var.folder
  hostname                    = var.hostname
  ignition_encoding           = var.ignition_encoding
  ip_address                  = var.ip_address
  ip_address_familiy          = var.ip_address_familiy
  ip_address_gateway          = var.ip_address_gateway
  ip_address_prefix           = var.ip_address_prefix
  memory                      = var.memory
  network_interface_mtu       = var.network_interface_mtu
  resource_pool               = var.resource_pool
  skip_customization          = var.skip_customization
  ssh_authorized_keys         = var.ssh_authorized_keys
  sshd_port                   = var.sshd_port
  template_vm                 = var.template_vm
  thin_provisioned            = var.thin_provisioned
  vcpus                       = var.vcpus
  vlan                        = var.vlan
  wait_for_guest_net_routable = var.wait_for_guest_net_routable
  wait_for_guest_net_timeout  = var.wait_for_guest_net_timeout

  providers = {
    vsphere = vsphere.default
  }

}

provider "vsphere" {
  user                 = var.vsphere_user
  password             = var.vsphere_password
  vsphere_server       = var.vsphere_server
  alias                = "default"
  allow_unverified_ssl = true
}

variable "adapter_type" {
  type = list
}

variable "datacenter" {
  type = string
}

variable "datastore_cluster" {
  type = string
}

variable "disks" {
  type = list
}

variable "dns_servers" {
  type = list
}

variable "eagerly_scrub" {
  type = string
}

variable "folder" {
  type = string
}

variable "hostname" {
  type = string
}

variable "ignition_encoding" {
  type = string
}

variable "ip_address" {
  type = list
}

variable "ip_address_familiy" {
  type = string
}

variable "ip_address_gateway" {
  type = list
}

variable "ip_address_prefix" {
  type = list
}

variable "memory" {
  type = string
}

variable "network_interface_mtu" {
  type = string
}

variable "resource_pool" {
  type = string
}

variable "skip_customization" {
  type = string
}

variable "ssh_authorized_keys" {
  type = list
}

variable "sshd_port" {
  type = string
}

variable "template_vm" {
  type = string
}

variable "thin_provisioned" {
  type = string
}

variable "vcpus" {
  type = string
}

variable "vlan" {
  type = list
}

variable "vsphere_password" {
  type = string
}

variable "vsphere_server" {
  type = string
}
variable "vsphere_user" {
  type = string
}

variable "wait_for_guest_net_routable" {
  type = string
}

variable "wait_for_guest_net_timeout" {
  type = string
} 