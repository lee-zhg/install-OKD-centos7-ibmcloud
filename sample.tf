data "ibm_security_group" "allow_all" {
    name = "allow_all"
}

data "ibm_security_group" "allow_http" {
    name = "allow_http"
}

data "ibm_security_group" "allow_https" {
    name = "allow_https"
}

data "ibm_security_group" "allow_outbound" {
    name = "allow_outbound"
}

data "ibm_security_group" "allow_ssh" {
    name = "allow_ssh"
}

resource "ibm_compute_vm_instance" "vm1" {
  hostname             = "vm1"
  domain               = "example.com"
  os_reference_code    = "CENTOS_7_64_LAMP"
  datacenter           = "dal06"
  network_speed        = 100
  hourly_billing       = true
  private_network_only = false
  cores                = 4
  memory               = 32768
  disks                = [100]
  local_disk           = false
  public_security_group_ids = ["${data.ibm_security_group.allow_all.id}", "${data.ibm_security_group.allow_http.id}", "${data.ibm_security_group.allow_https.id}", "${data.ibm_security_group.allow_outbound.id}", "${data.ibm_security_group.allow_ssh.id}"]
}
