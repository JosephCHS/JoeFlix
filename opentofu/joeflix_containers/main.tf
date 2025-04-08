resource "proxmox_lxc" "containers" {
  for_each = var.containers

  # Common configurations
  hostname      = each.key
  nameserver    = join(",", var.dns_servers)
  onboot        = var.onboot
  ostemplate    = each.value.template
  password      = each.key == "plex" ? var.password_lxc_plex : var.password_lxc
  start         = var.start
  swap          = var.swap
  target_node   = var.target_node
  unprivileged  = var.unprivileged
  
  # Specific configurations from map
  cores       = each.value.cores
  memory      = each.value.memory
  description = each.value.description
  tags        = each.value.tags
  vmid        = each.value.vmid

  ssh_public_keys = var.ssh_public_keys

  features {
    nesting = true
  }

  rootfs {
    storage = "local-lvm"
    size    = each.value.rootfs_size
  }

  dynamic "mountpoint" {
    for_each = each.value.shared_path != null ? [1] : []
    content {
      mp      = "/shared"
      storage = "media"
      volume  = each.value.shared_path
      size    = "0G"
      slot    = "0"
      key     = 0
    }
  }

  network {
    name     = var.network.name
    bridge   = var.network.bridge
    ip       = "192.168.1.${each.value.vmid}/24"
    gw       = var.network.gw
    firewall = var.network.firewall
  }
}

resource "null_resource" "proxmox_post_tasks" {
  depends_on = [proxmox_lxc.containers]

  provisioner "local-exec" {
    command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i hosts.yml main.yml --forks=15"
    environment = {
      ANSIBLE_HOST_KEY_CHECKING = "False"
    }
  }
}