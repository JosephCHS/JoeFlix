resource "proxmox_lxc" "plex_lxc" {
  # Specific variables
  cores       = 4
  description = "Media server platform to organize, stream, and transcode movies, TV shows, and music across various devices."
  hostname    = "plex"
  memory      = 30000
  tags        = "lxc;media"
  vmid        = var.plex_container_id
  # Non-specific variables
  nameserver   = join(",", var.dns_servers)
  onboot       = var.onboot
  ostemplate   = "local:vztmpl/ubuntu-22.04-standard_22.04-1_amd64.tar.zst"
  password     = var.password_lxc_plex
  start        = var.start
  swap         = var.swap
  target_node  = var.target_node
  unprivileged = var.unprivileged
  ssh_public_keys = <<-EOT
    ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMOAYPEDXQKHilhu+pmTFpk8Q/sHnI3hXEcuV+UUkNTd chs.jo@proton.me
  EOT  
  rootfs {
    storage = "local-lvm"
    size    = "500G"
  }
  mountpoint {
    mp      = "/shared"
    storage = "media"
    volume  = "/mnt/hdd14/data/media/"
    size    = "0G"
    slot    = "0"
    key     = 0
  }
  mountpoint {
    mp     = "/dev/dri"
    volume = "/dev/dri"
    size   = "0G"
    slot   = "1"
    key    = 1
  }
  network {
    name     = var.network.name
    bridge   = var.network.bridge
    ip       = "192.168.1.${var.plex_container_id}/24"
    gw       = var.network.gw
    firewall = var.network.firewall
  }
  # Wait for container to be reachable
  #depends_on = [null_resource.wait_for_plex]
  # Add a provisioner to run Ansible after the LXC container is created
  provisioner "local-exec" {
    # Only run after the LXC container is fully created and started
    when = create
    command = "sleep 15; ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i hosts.yml main.yml --limit plex -vvvv"
    environment = {
      ANSIBLE_HOST_KEY_CHECKING = "False"
    }
  }
}

resource "proxmox_lxc" "radarr_lxc" {
  # Specific variables
  cores       = 1
  description = "Movie management service, automating the process of searching, downloading, and organizing films."
  hostname    = "radarr"
  memory      = 2048
  tags        = "lxc;media"
  vmid        = var.radarr_container_id
  # Non-specific variables
  nameserver   = join(",", var.dns_servers)
  onboot       = var.onboot
  ostemplate   = var.template
  password     = var.password_lxc
  start        = var.start
  swap         = var.swap
  target_node  = var.target_node
  unprivileged = var.unprivileged
  ssh_public_keys = <<-EOT
    ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMOAYPEDXQKHilhu+pmTFpk8Q/sHnI3hXEcuV+UUkNTd chs.jo@proton.me
  EOT  
  rootfs {
    storage = "local-lvm"
    size    = "10G"
  }
  mountpoint {
    mp      = "/shared"
    storage = "media"
    volume  = "/mnt/hdd14/data/"
    size    = "0G"
    slot    = "0"
    key     = 0
  }
  network {
    name     = var.network.name
    bridge   = var.network.bridge
    ip       = "192.168.1.${var.radarr_container_id}/24"
    gw       = var.network.gw
    firewall = var.network.firewall
  }
  # Wait for container to be reachable
  #depends_on = [null_resource.wait_for_radarr]
  # Add a provisioner to run Ansible after the LXC container is created
  provisioner "local-exec" {
    # Only run after the LXC container is fully created and started
    when = create
    command = "sleep 15; ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i hosts.yml main.yml --limit radarr -vvvv"
    environment = {
      ANSIBLE_HOST_KEY_CHECKING = "False"
    }
  }
}

resource "proxmox_lxc" "flaresolverr_lxc" {
  # Specific variables
  cores       = 2
  description = "Bypass CAPTCHA challenges for web scraping services, enabling automated tasks behind restricted sites."
  hostname    = "flaresolverr"
  memory      = 2048
  tags        = "lxc;network"
  vmid        = var.flaresolverr_container_id
  # Non-specific variables
  nameserver   = join(",", var.dns_servers)
  onboot       = var.onboot
  ostemplate   = var.template
  password     = var.password_lxc
  start        = var.start
  swap         = var.swap
  unprivileged = var.unprivileged
  ssh_public_keys = <<-EOT
    ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMOAYPEDXQKHilhu+pmTFpk8Q/sHnI3hXEcuV+UUkNTd chs.jo@proton.me
  EOT  
  target_node  = var.target_node
  rootfs {
    size    = "4G"
    storage = "local-lvm"
  }
  network {
    name     = var.network.name
    bridge   = var.network.bridge
    ip       = "192.168.1.${var.flaresolverr_container_id}/24"
    gw       = var.network.gw
    firewall = var.network.firewall
  }
  # Wait for container to be reachable
  #depends_on = [null_resource.wait_for_flaresolverr]
  # Add a provisioner to run Ansible after the LXC container is created
  provisioner "local-exec" {
    # Only run after the LXC container is fully created and started
    when = create
    command = "sleep 15; ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i hosts.yml main.yml --limit flaresolverr -vvvv"
    environment = {
      ANSIBLE_HOST_KEY_CHECKING = "False"
    }
  }
}

resource "proxmox_lxc" "bazarr_lxc" {
  # Specific variables
  cores       = 2
  description = "Subtitle management service that automatically downloads and syncs subtitles for movies and TV shows in your library."
  memory      = 1024
  hostname    = "bazarr"
  tags        = "lxc;media"
  vmid        = var.bazarr_container_id
  # Non-specific variables
  nameserver   = join(",", var.dns_servers)
  onboot       = var.onboot
  ostemplate   = var.template
  password     = var.password_lxc
  start        = var.start
  swap         = var.swap
  unprivileged = var.unprivileged
  ssh_public_keys = <<-EOT
    ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMOAYPEDXQKHilhu+pmTFpk8Q/sHnI3hXEcuV+UUkNTd chs.jo@proton.me
  EOT  
  target_node  = var.target_node
  rootfs {
    size    = "4G"
    storage = "local-lvm"
  }
  mountpoint {
    mp      = "/shared"
    storage = "media"
    volume  = "/mnt/hdd14/data/"
    size    = "0G"
    slot    = "0"
    key     = 0
  }
  network {
    name     = var.network.name
    bridge   = var.network.bridge
    ip       = "192.168.1.${var.bazarr_container_id}/24"
    gw       = var.network.gw
    firewall = var.network.firewall
  }
  # Wait for container to be reachable
  #depends_on = [null_resource.wait_for_bazarr]
  # Add a provisioner to run Ansible after the LXC container is created
  provisioner "local-exec" {
    # Only run after the LXC container is fully created and started
    when = create
    command = "sleep 15; ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i hosts.yml main.yml --limit bazarr -vvvv"
    environment = {
      ANSIBLE_HOST_KEY_CHECKING = "False"
    }
  }
}

resource "proxmox_lxc" "calibre_web_lxc" {
  # Specific variables
  cores       = 2
  description = "A web-based eBook management platform, providing an intuitive interface to manage and read eBooks."
  hostname    = "calibre-web"
  memory      = 2048
  tags        = "lxc;media"
  vmid         = var.calibre_web_container_id
  # Non-specific variables
  nameserver   = join(",", var.dns_servers)
  onboot       = var.onboot
  ostemplate   = var.template
  password     = var.password_lxc
  start        = var.start
  swap         = var.swap
  unprivileged = var.unprivileged
  ssh_public_keys = <<-EOT
    ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMOAYPEDXQKHilhu+pmTFpk8Q/sHnI3hXEcuV+UUkNTd chs.jo@proton.me
  EOT  
  target_node  = var.target_node
  rootfs {
    size    = "4G"
    storage = "local-lvm"
  }
  mountpoint {
    mp      = "/shared"
    storage = "media"
    volume  = "/mnt/hdd14/data/media/books"
    size    = "0G"
    slot    = "0"
    key     = 0
  }
  network {
    name     = var.network.name
    bridge   = var.network.bridge
    ip       = "192.168.1.${var.calibre_web_container_id}/24"
    gw       = var.network.gw
    firewall = var.network.firewall
  }
  # Wait for container to be reachable
  #depends_on = [null_resource.wait_for_calibre_web]
  # Add a provisioner to run Ansible after the LXC container is created
  provisioner "local-exec" {
    # Only run after the LXC container is fully created and started
    when = create
    command = "sleep 15; ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i hosts.yml main.yml --limit calibre_web -vvvv"
    environment = {
      ANSIBLE_HOST_KEY_CHECKING = "False"
    }
  }
}

resource "proxmox_lxc" "lidarr_lxc" {
  # Specific variables
  cores       = 2
  description = "Music collection manager, automatically downloading and organizing music files from various sources."
  memory      = 1024
  hostname    = "lidarr"
  tags        = "lxc;media"
  vmid        = var.lidarr_container_id
  # Non-specific variables
  nameserver   = join(",", var.dns_servers)
  onboot       = var.onboot
  ostemplate   = var.template
  password     = var.password_lxc
  start        = var.start
  swap         = var.swap
  target_node  = var.target_node
  unprivileged = var.unprivileged
  ssh_public_keys = <<-EOT
    ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMOAYPEDXQKHilhu+pmTFpk8Q/sHnI3hXEcuV+UUkNTd chs.jo@proton.me
  EOT  
  rootfs {
    storage = "local-lvm"
    size    = "4G"
  }
  mountpoint {
    mp      = "/shared"
    storage = "media"
    volume  = "/mnt/hdd14/data/"
    size    = "0G"
    slot    = "0"
    key     = 0
  }
  network {
    name     = var.network.name
    bridge   = var.network.bridge
    ip       = "192.168.1.${var.lidarr_container_id}/24"
    gw       = var.network.gw
    firewall = var.network.firewall
  }
  # Wait for container to be reachable
  #depends_on = [null_resource.wait_for_lidarr]
  # Add a provisioner to run Ansible after the LXC container is created
  provisioner "local-exec" {
    # Only run after the LXC container is fully created and started
    when = create
    command = "sleep 15; ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i hosts.yml main.yml --limit lidarr -vvvv"
    environment = {
      ANSIBLE_HOST_KEY_CHECKING = "False"
    }
  }
}

resource "proxmox_lxc" "overseerr_lxc" {
  # Specific variables
  cores       = 3
  description = "Media request and management platform, allowing users to request movies and TV shows for download through automated tools."
  hostname    = "overseerr"
  memory      = 4096
  tags        = "lxc;media"
  vmid        = var.overseerr_container_id
  # Non-specific variables
  nameserver   = join(",", var.dns_servers)
  onboot       = var.onboot
  ostemplate   = var.template
  password     = var.password_lxc
  start        = var.start
  swap         = var.swap
  target_node  = var.target_node
  unprivileged = var.unprivileged
  ssh_public_keys = <<-EOT
    ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMOAYPEDXQKHilhu+pmTFpk8Q/sHnI3hXEcuV+UUkNTd chs.jo@proton.me
  EOT  
  rootfs {
    storage = "local-lvm"
    size    = "8G"
  }
  network {
    name     = var.network.name
    bridge   = var.network.bridge
    ip       = "192.168.1.${var.overseerr_container_id}/24"
    gw       = var.network.gw
    firewall = var.network.firewall
  }
  # Wait for container to be reachable
  #depends_on = [null_resource.wait_for_overseerr]
  # Add a provisioner to run Ansible after the LXC container is created
  provisioner "local-exec" {
    # Only run after the LXC container is fully created and started
    when = create
    command = "sleep 15; ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i hosts.yml main.yml --limit overseerr -vvvv"
    environment = {
      ANSIBLE_HOST_KEY_CHECKING = "False"
    }
  }
}

resource "proxmox_lxc" "prowlarr_lxc" {
  # Specific variables
  cores       = 2
  description = "Indexer manager that integrates with media automation tools like Sonarr and Radarr, searching for media across various trackers."
  hostname    = "prowlarr"
  memory      = 2048
  tags        = "lxc;media"
  vmid        = var.prowlarr_container_id
  # Non-specific variables
  nameserver    = join(",", var.dns_servers)
  onboot        = var.onboot
  ostemplate    = var.template
  password      = var.password_lxc
  swap          = var.swap
  start         = var.start
  target_node   = var.target_node
  unprivileged  = var.unprivileged
  rootfs {
    storage = "local-lvm"
    size    = "4G"
  }
  network {
    name     = var.network.name
    bridge   = var.network.bridge
    ip       = "192.168.1.${var.prowlarr_container_id}/24"
    gw       = var.network.gw
    firewall = var.network.firewall
  }
  # Wait for container to be reachable
  #depends_on = [null_resource.wait_for_prowlarr]
  # Add a provisioner to run Ansible after the LXC container is created
  provisioner "local-exec" {
    # Only run after the LXC container is fully created and started
    when = create
    command = "sleep 15; ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i hosts.yml main.yml --limit prowlarr -vvvv"
    environment = {
      ANSIBLE_HOST_KEY_CHECKING = "False"
    }
  }
}

resource "proxmox_lxc" "readarr_lxc" {
  # Specific variables
  cores       = 2
  description = "Book collection manager, automating the download and organization of eBooks and audiobooks."
  hostname    = "readarr"
  memory      = 2048
  tags        = "lxc;media"
  vmid        = var.readarr_container_id
  # Non-specific variables
  nameserver   = join(",", var.dns_servers)
  onboot       = var.onboot
  ostemplate   = var.template
  password     = var.password_lxc
  start        = var.start
  swap         = var.swap
  target_node  = var.target_node
  unprivileged = var.unprivileged
  ssh_public_keys = <<-EOT
    ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMOAYPEDXQKHilhu+pmTFpk8Q/sHnI3hXEcuV+UUkNTd chs.jo@proton.me
  EOT  
  rootfs {
    storage = "local-lvm"
    size    = "4G"
  }
  mountpoint {
    mp      = "/shared"
    storage = "media"
    volume  = "/mnt/hdd14/data/"
    size    = "0G"
    slot    = "0"
    key     = 0
  }
  network {
    name     = var.network.name
    bridge   = var.network.bridge
    ip       = "192.168.1.${var.readarr_container_id}/24"
    gw       = var.network.gw
    firewall = var.network.firewall
  }
  # Wait for container to be reachable
  #depends_on = [null_resource.wait_for_readarr]
  # Add a provisioner to run Ansible after the LXC container is created
  provisioner "local-exec" {
    # Only run after the LXC container is fully created and started
    when = create
    command = "sleep 15; ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i hosts.yml main.yml --limit readarr -vvvv"
    environment = {
      ANSIBLE_HOST_KEY_CHECKING = "False"
    }
  }
}

resource "proxmox_lxc" "sonarr_lxc" {
  # Specific variables
  cores       = 2
  description = "TV show management service, automating the process of searching, downloading, and organizing TV shows."
  hostname    = "sonarr"
  memory      = 2048
  tags        = "lxc;media"
  vmid        = var.sonarr_container_id
  # Non-specific variables
  nameserver   = join(",", var.dns_servers)
  onboot       = var.onboot
  ostemplate   = var.template
  password     = var.password_lxc
  start        = var.start
  swap         = var.swap
  target_node  = var.target_node
  unprivileged = var.unprivileged
  ssh_public_keys = <<-EOT
    ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMOAYPEDXQKHilhu+pmTFpk8Q/sHnI3hXEcuV+UUkNTd chs.jo@proton.me
  EOT  
  rootfs {
    size    = "5G"
    storage = "local-lvm"
  }
  mountpoint {
    mp      = "/shared"
    storage = "media"
    volume  = "/mnt/hdd14/data/"
    size    = "0G"
    slot    = "0"
    key     = 0
  }
  network {
    name     = var.network.name
    bridge   = var.network.bridge
    ip       = "192.168.1.${var.sonarr_container_id}/24"
    gw       = var.network.gw
    firewall = var.network.firewall
  }
  # Wait for container to be reachable
  #depends_on = [null_resource.wait_for_sonarr]
  # Add a provisioner to run Ansible after the LXC container is created
  provisioner "local-exec" {
    # Only run after the LXC container is fully created and started
    when = create
    command = "sleep 15; ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i hosts.yml main.yml --limit sonarr -vvvv"
    environment = {
      ANSIBLE_HOST_KEY_CHECKING = "False"
    }
  }
}

resource "proxmox_lxc" "tautulli_lxc" {
  # Specific variables
  cores       = 2
  description = "Plex usage monitoring and analytics tool, providing insights into media consumption and performance."
  hostname    = "tautulli"
  memory      = 1024
  tags        = "lxc;media"
  vmid        = var.tautulli_container_id
  # Non-specific variables
  nameserver   = join(",", var.dns_servers)
  onboot       = var.onboot
  ostemplate   = var.template
  password     = var.password_lxc
  start        = var.start
  swap         = var.swap
  target_node  = var.target_node
  unprivileged = var.unprivileged
  ssh_public_keys = <<-EOT
    ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMOAYPEDXQKHilhu+pmTFpk8Q/sHnI3hXEcuV+UUkNTd chs.jo@proton.me
  EOT  
  network {
    name     = var.network.name
    bridge   = var.network.bridge
    ip       = "192.168.1.${var.tautulli_container_id}/24"
    gw       = var.network.gw
    firewall = var.network.firewall
  }
  rootfs {
    storage = "local-lvm"
    size    = "4G"
  }
  # Wait for container to be reachable
  #depends_on = [null_resource.wait_for_tautulli]
  # Add a provisioner to run Ansible after the LXC container is created
  provisioner "local-exec" {
    # Only run after the LXC container is fully created and started
    when = create
    command = "sleep 15; ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i hosts.yml main.yml --limit tautulli -vvvv"
    environment = {
      ANSIBLE_HOST_KEY_CHECKING = "False"
    }
  }
}

resource "proxmox_lxc" "kavita_lxc" {
  # Specific variables
  cores       = 2
  description = "A fast and feature-rich eBook and comic book server, providing a web-based interface for reading and organizing content."
  hostname    = "kavita"
  memory      = 4096
  tags        = "lxc;media"
  vmid        = var.kavita_container_id
  # Non-specific variables
  nameserver   = join(",", var.dns_servers)
  onboot       = var.onboot
  ostemplate   = var.template
  password     = var.password_lxc
  start        = var.start
  swap         = var.swap
  target_node  = var.target_node
  unprivileged = var.unprivileged
  ssh_public_keys = <<-EOT
    ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMOAYPEDXQKHilhu+pmTFpk8Q/sHnI3hXEcuV+UUkNTd chs.jo@proton.me
  EOT  
  rootfs {
    storage = "local-lvm"
    size    = "10G"
  }
  mountpoint {
    mp      = "/shared"
    storage = "media"
    volume  = "/mnt/hdd14/data/media/books"
    size    = "0G"
    slot    = "0"
    key     = 0
  }
  network {
    name     = var.network.name
    bridge   = var.network.bridge
    ip       = "192.168.1.${var.kavita_container_id}/24"
    gw       = var.network.gw
    firewall = var.network.firewall
  }
  # Wait for container to be reachable
  #depends_on = [null_resource.wait_for_kavita]
  # Add a provisioner to run Ansible after the LXC container is created
  provisioner "local-exec" {
    # Only run after the LXC container is fully created and started
    when = create    
    command = "sleep 15; ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i hosts.yml main.yml --limit kavita -vvvv"
    environment = {
      ANSIBLE_HOST_KEY_CHECKING = "False"
    }
  }
}
resource "proxmox_lxc" "homepage_lxc" {
  # Specific variables
  cores       = 1
  description = "A customizable, dashboard-like homepage for quick access to frequently used services and information."
  hostname    = "homepage"
  memory      = 1024
  tags        = "lxc;dashboard"
  vmid        = var.homepage_container_id
  # Non-specific variables
  nameserver   = join(",", var.dns_servers)
  onboot       = var.onboot
  ostemplate   = var.template
  password     = var.password_lxc
  start        = var.start
  swap         = var.swap
  target_node  = var.target_node
  unprivileged = var.unprivileged
  ssh_public_keys = <<-EOT
    ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMOAYPEDXQKHilhu+pmTFpk8Q/sHnI3hXEcuV+UUkNTd chs.jo@proton.me
  EOT  
  rootfs {
    size    = "3G"
    storage = "local-lvm"
  }
  network {
    name     = var.network.name
    bridge   = var.network.bridge
    ip       = "192.168.1.${var.homepage_container_id}/24"
    gw       = var.network.gw
    firewall = var.network.firewall
  }
  # Wait for container to be reachable
  #depends_on = [null_resource.wait_for_homepage]
  # Add a provisioner to run Ansible after the LXC container is created  
  provisioner "local-exec" {
    # Only run after the LXC container is fully created and started
    when = create
    command = "sleep 15; ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i hosts.yml main.yml --limit homepage -vvvv"
    environment = {
      ANSIBLE_HOST_KEY_CHECKING = "False"
    }
  }
}

resource "proxmox_lxc" "qbittorrent_lxc" {
  # Specific variables
  cores       = 3
  description = "Open-source torrent client, providing automated and manual torrent management for downloading media."
  hostname    = "qbittorrent"
  memory      = 6000
  tags        = "lxc;media"
  vmid        = var.qbittorrent_container_id
  # Non-specific variables
  nameserver   = join(",", var.dns_servers)
  onboot       = var.onboot
  ostemplate   = var.template
  password     = var.password_lxc
  start        = var.start
  swap         = var.swap
  target_node  = var.target_node
  unprivileged = var.unprivileged
  ssh_public_keys = <<-EOT
    ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMOAYPEDXQKHilhu+pmTFpk8Q/sHnI3hXEcuV+UUkNTd chs.jo@proton.me
  EOT  
  rootfs {
    storage = "local-lvm"
    size    = "10G"
  }
  mountpoint {
    mp      = "/shared"
    storage = "media"
    volume  = "/mnt/hdd14/data/torrents"
    size    = "0G"
    slot    = "0"
    key     = 0
  }
  network {
    name     = var.network.name
    bridge   = var.network.bridge
    ip       = "192.168.1.${var.qbittorrent_container_id}/24"
    gw       = var.network.gw
    firewall = var.network.firewall
  }
  # Wait for container to be reachable
  #depends_on = [null_resource.wait_for_qbittorrent]
  # Add a provisioner to run Ansible after the LXC container is created  
  provisioner "local-exec" {
    # Only run after the LXC container is fully created and started
    when = create
    command = "sleep 15; ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i hosts.yml main.yml --limit qbittorrent -vvvv"
    environment = {
      ANSIBLE_HOST_KEY_CHECKING = "False"
    }
  }
}

resource "proxmox_lxc" "gotify_lxc" {
  # Specific variables
  cores       = 1
  description = "A self-hosted notification service for sending real-time alerts and notifications across devices."
  hostname    = "gotify"
  memory      = 1024
  tags        = "lxc;communication"
  vmid        = var.gotify_container_id
  # Non-specific variables
  nameserver   = join(",", var.dns_servers)
  onboot       = var.onboot
  ostemplate   = var.template
  password     = var.password_lxc
  start        = var.start
  swap         = var.swap
  target_node  = var.target_node
  unprivileged = var.unprivileged
  ssh_public_keys = <<-EOT
    ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMOAYPEDXQKHilhu+pmTFpk8Q/sHnI3hXEcuV+UUkNTd chs.jo@proton.me
  EOT  
  rootfs {
    size    = "2G"
    storage = "local-lvm"
  }
  network {
    name     = var.network.name
    bridge   = var.network.bridge
    ip       = "192.168.1.${var.gotify_container_id}/24"
    gw       = var.network.gw
    firewall = var.network.firewall
  }
  # Wait for container to be reachable
  #depends_on = [null_resource.wait_for_gotify]
  # Add a provisioner to run Ansible after the LXC container is created  
  
  provisioner "local-exec" {
    # Only run after the LXC container is fully created and started
    when = create
    command = "sleep 15; ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i hosts.yml main.yml --limit gotify -vvvv"
    environment = {
      ANSIBLE_HOST_KEY_CHECKING = "False"
    }
  }
}