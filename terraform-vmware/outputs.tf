output "vm_names" {
  description = "Names of created VMs"
  value       = vsphere_virtual_machine.vm[*].name
}

output "vm_ips" {
  description = "IP addresses of created VMs"
  value       = vsphere_virtual_machine.vm[*].default_ip_address
}
