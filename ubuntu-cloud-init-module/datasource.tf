data template_file "userdata" {

  template = file("${path.module}/userdata.yml")
  vars = {
    ci_ssh_rsa_pub = "${var.mod_ci_ssh_rsa_pub}"
    ci_hostname = "${var.mod_vm_name}"
    ci_instance_id = "${var.mod_vm_name}"
  }
}