# ------------------------------------------------------------------------------
# CoreOS Base VM node
# ------------------------------------------------------------------------------

resource "vsphere_virtual_machine" "default" {

  name                  = trimspace(var.hostname)
  resource_pool_id      = data.vsphere_resource_pool.resource_pool.id  
  datastore_cluster_id  = data.vsphere_datastore_cluster.datastore_cluster.id
  num_cpus              = var.vcpus
  memory                = var.memory
  folder                = var.folder  
  guest_id              = data.vsphere_virtual_machine.template_vm.guest_id
  scsi_type             = data.vsphere_virtual_machine.template_vm.scsi_type

  # Interfaces
  dynamic "network_interface" {
    for_each = var.vlan

    content {
      network_id   = data.vsphere_network.vlan[network_interface.key].id
      adapter_type = var.adapter_type[network_interface.key]
    }
  }

  # System disk
  disk {
    label            = "${var.hostname}.vmdk"
    size             = data.vsphere_virtual_machine.template_vm.disks.0.size
    eagerly_scrub    = var.eagerly_scrub
    thin_provisioned = var.thin_provisioned
    unit_number      = 0
  }

  # Additional disks
  dynamic "disk" {
    for_each = var.disks

    content {
      label            = "${var.hostname}-${disk.key+1}.vmdk"
      size             = disk.value
      eagerly_scrub    = var.eagerly_scrub
      thin_provisioned = var.thin_provisioned
      unit_number      = disk.key+1
    }

  }

  extra_config = {
    "guestinfo.coreos.config.data"          = base64encode(data.ignition_config.default.rendered)
    "guestinfo.coreos.config.data.encoding" = var.ignition_encoding
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.template_vm.id
  }

  lifecycle {
    # Dont trigger a re-creation unless tainted. num_cpus and memory will trigger reboot
    ignore_changes = [      
      wait_for_guest_net_routable, 
      wait_for_guest_net_timeout,
      clone,
      extra_config,
      disk,
      network_interface,
      name,
      resource_pool_id,
      datastore_cluster_id,
      folder,
      guest_id,
      scsi_type
    ]
  }

  wait_for_guest_net_routable = var.wait_for_guest_net_routable
  wait_for_guest_net_timeout  = var.wait_for_guest_net_timeout

}
