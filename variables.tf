variable "ssh_key" {
  description = "Public SSH key"
  default = <public SSH key> //TODO
}
variable "proxmox_host" {
    description = "Node used for all kind of services related to media like movies, series, books, but not images"
    default = "pve_joeflix"
}
variable "template_name" {
    description = "Template name used"
    default = "ubuntu-2204-template"
}
variable "nic_name" {
  description = "The network interface name for the container (e.g., eth0)"
  default     = "vmbr0"
}
/* 
  Establish the VLAN you'd like to use
  variable "vlan_num" {
    default = "place_vlan_number_here"
  }
*/
variable "api_url" {
    description = "Adress to reach proxmox's GUI, ID and IP match"
    default = "https://192.168.1.12:8006/api2/json"
}
