variable "instance_number" {
  description = "Unique ID for the container used for its ID and the last number of its IP address"
  type = number
}

variable "cpu_cores" {
  description = "The number of cores assigned to the container."
  type = number
  default = 1
}

variable "description" {
  description = "Sets the container description seen in the web interface."
  type = string
  default = "LXC container for JoeFlix"
}

variable "disk_size" {
  description = "Disk size for the container"
  type = string
}

variable "dns_servers" {
  description = "List of DNS servers"
  type = list(string)
  default = ["1.1.1.1", "8.8.8.8"]
}

variable "hostname" {
  description = "Specify the hostname of the container"
  type = string
}

variable "memory" {
  description = " A number containing the amount of RAM to assign to the container (in MB)."
  type = number
  default = "1024"
}

variable "mountpoint" {
  description = "An object for defining a volume to use as a container mount point. Can be specified multiple times. Without volume defined, Proxmox will try to create a volume with the value of storage + : + size (without the trailing G) - e.g. /srv/host/bind-mount-point:256. This behaviour looks to be caused by a bug in the provider."
  type = object({
    mp = string
    storage = string
    volume = string
    slot = string
    key = number
    acl = boolean
    backup = boolean
    quota = boolean
    replicate = boolean
    shared = boolean
  })
  default = {
    mp = "/shared"
    storage = "/mnt/hdd14/media"
    volume = "/mnt/hdd14/media"
    size = "0"
    slot = "1"
    key = 1
    acl = false
    backup = false
    quota = false
    replicate = false
    shared = false
  }
}

variable "network" {
  description = "Network configuration, network interface name and IP"
  type = object({
    name = string
    bridge = string
    ip = string
    gw = string
    firewall = boolean
  })
  default = {
    name = "eth0"
    bridge = "vmbr0"
    ip = "192.168.1.999/24"
    gw = "192.168.1.254"
    firewall = false
  }
}

variable "onboot" {
  description = "A boolean that determines if the container will start on boot."
  type = boolean
  default = true
}

variable "rootfs" {
  description = "File system and storage quantity allowed for LXC container"
  type = object({
    storage = string
    size = string
  })
  default = {
    name = "local-zfs"
    size = "5G"
  }
}

variable "swap" {
  description = "A number that sets the amount of swap memory available to the container."
  type = number
  default = 512
}

variable "tags" {
  description = "Tags of the container, semicolon-delimited (e.g. "terraform;test"). This is only meta information."
  type = string
  default = "LXC"
}

variable "target_node" {
  description = "Proxmox node to be used"
  type = string
  default = "joeflix"
}

variable "template" {
  description = "LXC template to use"
  type = string
  default = "debian-12-standard_12.2-1_amd64.tar.gz"
}

variable "unprivileged" {
  description = "Set the global right for the LXC container"
  type = boolean
  default = true
}