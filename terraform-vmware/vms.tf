resource "vsphere_virtual_machine" "vm" {
  count            = var.vm_count
  name             = "${var.vm_name_prefix}-${count.index + 1}"
  resource_pool_id = data.vsphere_host.host.resource_pool_id
  datastore_id     = data.vsphere_datastore.datastore.id
  folder           = var.folder

  num_cpus = var.vm_cpu
  memory   = var.vm_memory
  guest_id = "ubuntu64Guest"

  network_interface {
    network_id = data.vsphere_network.network.id
  }

  disk {
    label            = "disk0"
    size             = 20
    thin_provisioned = true
  }

  cdrom {
    datastore_id = data.vsphere_datastore.datastore.id
    path         = var.iso_path
  }

  wait_for_guest_net_timeout = 0
  wait_for_guest_ip_timeout  = 0

  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
  }

  extra_config = {
    "guestinfo.userdata"          = base64encode(local.user_data[count.index])
    "guestinfo.userdata.encoding" = "base64"
  }

  firmware = "efi"
}
