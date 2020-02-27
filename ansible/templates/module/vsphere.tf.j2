# ------------------------------------------------------------------------------
# vSphere
# ------------------------------------------------------------------------------

data vsphere_datacenter "dc" {
  name = var.datacenter
}

data "vsphere_datastore_cluster" "datastore_cluster" {
  name          = var.datastore_cluster
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_resource_pool" "resource_pool" {
  name          = var.resource_pool
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "vlan" {
  count         = length(var.vlan)
  name          = var.vlan[count.index]
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_virtual_machine" "template_vm" {
  name          = var.template_vm
  datacenter_id = data.vsphere_datacenter.dc.id
}
