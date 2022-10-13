resource "vcd_vapp" "vapp" {
  name                       = var.vapp_name
  metadata                   = {
    Tag                      = "Managed by Terraform"
                            }
}

resource "vcd_vapp_org_network" "vapp_network" {
  org                        = var.org_name
  vdc                        = var.org_vdc
  vapp_name                  = vcd_vapp.vapp.name
  org_network_name           = var.vapp_network
}

module "ubuntu-cloud-init-module" {
  for_each = var.vms
  source   = "./ubuntu-cloud-init-module"
  mod_vapp_name          = vcd_vapp.vapp.name
  mod_catalog            = data.vcd_catalog.my_cat.name
  mod_template_vm        = var.template_vm
  mod_ci_ssh_rsa_pub     = var.ci_ssh_rsa_pub
  mod_vm_mem             = var.vm_mem
  mod_vm_cpus            = var.vm_cpus
  mod_system_disk_size   = var.system_disk_size
  mod_storage_profile    = var.storage_profile
  mod_vapp_network       = var.vapp_network
  mod_vm_data_disks      = var.vm_data_disks
  mod_vm_name            = "${each.value.vm_name}"
  mod_ip_addr            = "${each.value.ip_addr}"
}