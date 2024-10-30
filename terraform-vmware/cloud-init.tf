locals {
  user_data = {
    for idx in range(var.vm_count) : idx => templatefile("${path.module}/templates/user-data.yaml", {
      vm_name_prefix  = var.vm_name_prefix
      domain         = var.domain
      ssh_public_key = var.ssh_public_key
      index          = idx + 1
    })
  }
}