module "odn1-vlb-test-002" {

  source = "/module"

  adapter_type                = var.odn1-vlb-test-002_adapter_type
  datacenter                  = var.odn1-vlb-test-002_datacenter
  datastore_cluster           = var.odn1-vlb-test-002_datastore_cluster
  disks                       = var.odn1-vlb-test-002_disks
  dns_servers                 = var.odn1-vlb-test-002_dns_servers
  eagerly_scrub               = var.odn1-vlb-test-002_eagerly_scrub
  folder                      = var.odn1-vlb-test-002_folder
  hostname                    = var.odn1-vlb-test-002_hostname
  ignition_encoding           = var.odn1-vlb-test-002_ignition_encoding
  ip_address                  = var.odn1-vlb-test-002_ip_address
  ip_address_familiy          = var.odn1-vlb-test-002_ip_address_familiy
  ip_address_gateway          = var.odn1-vlb-test-002_ip_address_gateway
  ip_address_prefix           = var.odn1-vlb-test-002_ip_address_prefix
  memory                      = var.odn1-vlb-test-002_memory
  network_interface_mtu       = var.odn1-vlb-test-002_network_interface_mtu
  resource_pool               = var.odn1-vlb-test-002_resource_pool
  skip_customization          = var.odn1-vlb-test-002_skip_customization
  ssh_authorized_keys         = var.odn1-vlb-test-002_ssh_authorized_keys
  sshd_port                   = var.odn1-vlb-test-002_sshd_port
  template_vm                 = var.odn1-vlb-test-002_template_vm
  thin_provisioned            = var.odn1-vlb-test-002_thin_provisioned
  vcpus                       = var.odn1-vlb-test-002_vcpus
  vlan                        = var.odn1-vlb-test-002_vlan
  wait_for_guest_net_routable = var.odn1-vlb-test-002_wait_for_guest_net_routable
  wait_for_guest_net_timeout  = var.odn1-vlb-test-002_wait_for_guest_net_timeout

  providers = {
    vsphere = vsphere.odn1-vlb-test-002
  }

}

provider "vsphere" {
  user                 = var.odn1-vlb-test-002_vsphere_user
  password             = var.odn1-vlb-test-002_vsphere_password
  vsphere_server       = var.odn1-vlb-test-002_vsphere_server
  alias                = "odn1-vlb-test-002"
  allow_unverified_ssl = true
}

variable "odn1-vlb-test-002_adapter_type" {
  type = list
}

variable "odn1-vlb-test-002_datacenter" {
  type = string
}

variable "odn1-vlb-test-002_datastore_cluster" {
  type = string
}

variable "odn1-vlb-test-002_disks" {
  type = list
}

variable "odn1-vlb-test-002_dns_servers" {
  type = list
}

variable "odn1-vlb-test-002_eagerly_scrub" {
  type = string
}

variable "odn1-vlb-test-002_folder" {
  type = string
}

variable "odn1-vlb-test-002_hostname" {
  type = string
}

variable "odn1-vlb-test-002_ignition_encoding" {
  type = string
}

variable "odn1-vlb-test-002_ip_address" {
  type = list
}

variable "odn1-vlb-test-002_ip_address_familiy" {
  type = string
}

variable "odn1-vlb-test-002_ip_address_gateway" {
  type = list
}

variable "odn1-vlb-test-002_ip_address_prefix" {
  type = list
}

variable "odn1-vlb-test-002_memory" {
  type = string
}

variable "odn1-vlb-test-002_network_interface_mtu" {
  type = string
}

variable "odn1-vlb-test-002_resource_pool" {
  type = string
}

variable "odn1-vlb-test-002_skip_customization" {
  type = string
}

variable "odn1-vlb-test-002_ssh_authorized_keys" {
  type = list
}

variable "odn1-vlb-test-002_sshd_port" {
  type = string
}

variable "odn1-vlb-test-002_template_vm" {
  type = string
}

variable "odn1-vlb-test-002_thin_provisioned" {
  type = string
}

variable "odn1-vlb-test-002_vcpus" {
  type = string
}

variable "odn1-vlb-test-002_vlan" {
  type = list
}

variable "odn1-vlb-test-002_vsphere_password" {
  type = string
}

variable "odn1-vlb-test-002_vsphere_server" {
  type = string
}
variable "odn1-vlb-test-002_vsphere_user" {
  type = string
}

variable "odn1-vlb-test-002_wait_for_guest_net_routable" {
  type = string
}

variable "odn1-vlb-test-002_wait_for_guest_net_timeout" {
  type = string
} 