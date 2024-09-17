resource "proxmox_lxc" "container" {
  vmid          = var.instance_number
  target_node   = var.target_node
  hostname      = var.hostname
  cores         = var.cpu_cores
  memory        = var.memory
  password      = var.password_lxc
  network       {
    name = var.network.name
    bridge = var.network.bridge
    ip = "192.168.1.${var.instance_number}/24"
    gw = var.network.gw
    firewall = var.network.firewall
  }
  ostemplate    = var.template
  rootfs        = var.rootfs
  unprivileged  = var.unprivileged
  onboot        = var.onboot
  description   = var.description
  mountpoint    = var.mountpoint
  swap          = var.swap
  tags          = var.tags
  firewall      = var.firewall
  nameserver    = join(",", var.dns_servers)
}