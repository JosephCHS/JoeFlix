resource "proxmox_lxc" "container" {
  vmid          = var.instance_number
  hostname      = var.hostname
  description   = var.description
  target_node   = var.target_node
  rootfs {
    storage  = var.rootfs.storage
    size     = var.rootfs.size
  }
  cores         = var.cpu_cores
  memory        = var.memory
  tags          = var.tags
  password      = var.password_lxc
  network {
    name     = var.network.name
    bridge   = var.network.bridge
    ip       = "192.168.1.${var.instance_number}/24"
    gw       = var.network.gw
    firewall = var.network.firewall
  }
  ostemplate    = var.template
  unprivileged  = var.unprivileged
  onboot        = var.onboot
  mountpoint {
    mp          = "/shared"
    storage     = "media"
    volume      = "/mnt/hdd14/data"
    size        = "0G"
    slot        = "1"
    key         = 1
    acl         = false
    backup      = false
    quota       = false
    replicate   = false
    shared      = false
  }
  swap          = var.swap
  start         = var.start
  nameserver    = join(",", var.dns_servers)
}