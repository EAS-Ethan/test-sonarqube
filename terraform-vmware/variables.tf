variable "vsphere_user" {
  description = "vSphere user name"
  type        = string
}

variable "vsphere_password" {
  description = "vSphere password"
  type        = string
  sensitive   = true
}

variable "vsphere_server" {
  description = "vSphere server"
  type        = string
}

variable "datacenter" {
  description = "vSphere datacenter name"
  type        = string
}

variable "datastore" {
  description = "vSphere datastore name"
  type        = string
}

variable "host" {
  description = "ESXi host name"
  type        = string
}

variable "network" {
  description = "vSphere network name"
  type        = string
}

variable "vm_count" {
  description = "Number of VMs to create"
  type        = number
  default     = 1
}

variable "vm_name_prefix" {
  description = "Prefix for VM names"
  type        = string
  default     = "harness-vm"
}

variable "vm_cpu" {
  description = "Number of CPU cores for each VM"
  type        = number
  default     = 2
}

variable "vm_memory" {
  description = "Amount of memory for each VM (in MB)"
  type        = number
  default     = 4096
}

variable "folder" {
  description = "Folder path for VM placement"
  type        = string
  default     = ""  # Empty string means root folder
}

variable "iso_path" {
  description = "Path to the ISO file in datastore"
  type        = string
  default     = "[VM_STORAGE] iso/ubuntu-20.04.6-live-server-amd64.iso"
}

variable "domain" {
  description = "Domain name for the VMs"
  type        = string
  default     = "local"
}

variable "ssh_public_key" {
  description = "SSH public key for VM access"
  type        = string
}

variable "template_name" {
  description = "Name of the VM template to clone from"
  type        = string
}
