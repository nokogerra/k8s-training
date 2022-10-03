variable "mod_vapp_name" {
  description = ""
  default = "default"  
}

variable "mod_catalog" {
  description = ""
  default = "default"  
}

variable "mod_template_vm" {
  description = ""
  default = "default"  
}

variable "mod_ci_ssh_rsa_pub" {
  description = ""
  default = "default"  
}

variable "mod_vm_mem" {
  description = ""
  default = "2"  
}
variable "mod_vm_cpus" {
  description = ""
  default = "default"  
}

variable "mod_storage_profile" {
  description = ""
  default = "default"  
}

variable "mod_vm_name" {
  description = ""
  default = "default"  
}

variable "mod_vapp_network" {
  description = ""
  default = "default"  
}

variable "mod_ip_addr" {
  description = ""
  default = "default"  
}

variable "mod_vm_data_disks" {
  type = list(object({
#    mount_point     = string
#    file_system     = string
#    storage_profile = string
    size            = number
  }))

  description = "VM hard drives"
  default     = []
}
