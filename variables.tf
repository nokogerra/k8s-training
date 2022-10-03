# Provider vars
variable "org_user" {
  default     = "administrator"
  description = "vCD Tenant User"
}

variable "org_password" {
  default     = "password"
  description = "vCD Tenant Password"
}

variable "org_name" {
  default     = "def_org"
  description = "vCD Tenant Org"
}

variable "org_url" {
  default     = "https://vcd.vmcloud.reg.ru/api"
  description = "vCD Tenant URL"
}

variable "org_vdc" {
  default     = "def_org_vdc"
  description = "vCD Tenant VDC"
}

variable "org_max_retry_timeout" {
  description = "Retry Timeout"
  default     = "240"
}

variable "org_allow_unverified_ssl" {
  description = "vCD allow unverified SSL"
  default     = "true"
}

variable "org_edge_gw" {
  description = "vCD edge name"
  default     = "none"
}

variable "org_catalog" {
  description = "vCD Catalog Name"
  default = "DR-catalogina"
}

variable "template_vm" {
  description = "template vm"
  default = "focal-server-cloudimg-amd64"
}

variable "os_type" {
  description = "OS Type"
  default = "ubuntu64Guest"
  
}

variable "vapp_network" {
  description = ""
  default     = "dr-nw01-z01"
}

variable "storage_profile" {
  description = ""
  default     = "DPLabCompSSD"
}

#VM vars
variable "vms" {
    type = map(object({
        vm_name = string
        ip_addr = string
    }))
    default = {}
}

variable "vapp_name" {
  description = ""
  default = "default"  
}

variable "ci_ssh_rsa_pub" {
  description = ""
  default = "default"  
}

variable "vm_mem" {
  description = ""
  default = "2"  
}
variable "vm_cpus" {
  description = ""
  default = "default"  
}

variable "vm_data_disks" {
  type = list(object({
#    mount_point     = string
#    file_system     = string
#    storage_profile = string
    size            = number
  }))

  description = "VM hard drives"
  default     = []
}
