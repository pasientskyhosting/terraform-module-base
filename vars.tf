# ---------------------------------------------------------------------------------------------------------------------
# VSPHERE
# ---------------------------------------------------------------------------------------------------------------------

variable "hostname" {
  type = string
}

variable "datacenter" {
  description = "The name of a datacenter in which to launch the virtual machine e.g cph1"
}

variable "skip_customization" {
  description = "Skip customization after creation"
}

variable "wait_for_guest_net_routable" {
  description = "Let terraform wait for routable net before finishing"
}

variable "wait_for_guest_net_timeout" {
  description = "Let terraform wait for network timeout"
}

variable "eagerly_scrub" {
  description = "Set disk(s) to eager zeroed"
}

variable "thin_provisioned" {
  description = "Set disk(s) to thin provisioned"
}

variable "vcpus" {
  description = "Number of CPUs"
}

variable "memory" {
  description = "VM host memory"
}

variable "datastore_cluster" {
  description = "Datastore cluster to create VM"
}

variable "folder" {
  description = "Inventory folder to store VM in"
}

variable "resource_pool" {
  description = "vSphere resource pool"
}

# Properties below can only occur once
variable "template_vm" {
  description = "Template path to clone. E.g templates/coreos_1520.8.0"
}

variable "adapter_type" {
  description = "Adapter type for VM"
  type        = list
}

variable "vlan" {
  description = "Vlan to attach interfaces to"
  type = list
}

variable "disks" {
  description = "Additional disk represented by their size. e.g: [20,40,60]"
  type = list
}

variable "ignition_encoding" {
  type = string
  description = "Encoding type for ignition data"
}

variable "ssh_authorized_keys" {
  type = list
  default = []
}