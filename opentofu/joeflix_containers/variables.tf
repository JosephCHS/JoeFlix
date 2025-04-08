# Auth
variable "password_lxc" {
  description = "Password for private LXC containers"
  type        = string
  sensitive   = true
}

variable "password_lxc_plex" {
  description = "Password for public LXC containers"
  type        = string
  sensitive   = true
}

variable "ssh_public_keys" {
  description = "SSH public keys for container access"
  type        = string
}

variable "token_nordvpn" {
  description = "Token for NordVPN authentication"
  type        = string
  sensitive   = true
}

# Containers
variable "container_base_config" {
  type = object({
    onboot       = bool
    start        = bool
    swap         = number
    unprivileged = bool
    target_node  = string
  })
  default = {
    onboot       = true
    start        = true
    swap         = 512
    unprivileged = true
    target_node  = "joeflix"
  }
}

variable "container_ids" {
  type = map(number)
  default = {
    plex          = 101
    radarr        = 102
    sonarr        = 103
    bazarr        = 104
    lidarr        = 105
    prowlarr      = 106
    readarr       = 107
    overseerr     = 108
    flaresolverr  = 109
    tautulli      = 110
    calibre_web   = 111
    kavita        = 112
    qbittorrent   = 113
    homepage      = 114
    gotify        = 115
  }
}

locals {
  container_ips = {
    for name, id in var.container_ids : name => "192.168.1.${id}/24"
  }
}

variable "containers" {
  description = "Map of container configurations"
  type = map(object({
    cores       = number
    memory      = number
    description = string
    tags        = string
    vmid        = number
    rootfs_size = string
    shared_path = optional(string)
    ostemplate   = string
  }))
  default = {
    plex = {
      cores       = 4
      memory      = 30000
      description = "Media server platform to organize, stream, and transcode movies, TV shows, and music across various devices."
      tags        = "lxc;media"
      vmid        = 101
      rootfs_size = "500G"
      shared_path = "/mnt/hdd14/data/media/"
      ostemplate  = "local:vztmpl/ubuntu-22.04-standard_22.04-1_amd64.tar.zst"
    },
    radarr = {
      cores       = 1
      memory      = 2048
      description = "Movie management service, automating the process of searching, downloading, and organizing films."
      tags        = "lxc;media"
      vmid        = 102
      rootfs_size = "10G"
      shared_path = "/mnt/hdd14/data/"
      ostemplate  = "local:vztmpl/debian-12-standard_12.2-1_amd64.tar.zst"
    },
    sonarr = {
      cores       = 1
      memory      = 2048
      description = "TV series management service, automating the process of searching, downloading, and organizing shows."
      tags        = "lxc;media"
      vmid        = 103
      rootfs_size = "10G"
      shared_path = "/mnt/hdd14/data/"
      ostemplate  = "local:vztmpl/debian-12-standard_12.2-1_amd64.tar.zst"
    },
    bazarr = {
      cores       = 1
      memory      = 2048
      description = "Subtitle management service for Radarr and Sonarr."
      tags        = "lxc;media"
      vmid        = 104
      rootfs_size = "10G"
      shared_path = "/mnt/hdd14/data/"
      ostemplate  = "local:vztmpl/debian-12-standard_12.2-1_amd64.tar.zst"
    },
    lidarr = {
      cores       = 1
      memory      = 2048
      description = "Music collection manager for downloading and organizing music."
      tags        = "lxc;media"
      vmid        = 105
      rootfs_size = "10G"
      shared_path = "/mnt/hdd14/data/"
      ostemplate  = "local:vztmpl/debian-12-standard_12.2-1_amd64.tar.zst"
    },
    prowlarr = {
      cores       = 1
      memory      = 2048
      description = "Indexer manager for all your media needs."
      tags        = "lxc;media"
      vmid        = 106
      rootfs_size = "10G"
      shared_path = "/mnt/hdd14/data/"
      ostemplate  = "local:vztmpl/debian-12-standard_12.2-1_amd64.tar.zst"
    },
    readarr = {
      cores       = 1
      memory      = 2048
      description = "Book collection manager for downloading and organizing books."
      tags        = "lxc;media"
      vmid        = 107
      rootfs_size = "10G"
      shared_path = "/mnt/hdd14/data/"
      ostemplate  = "local:vztmpl/debian-12-standard_12.2-1_amd64.tar.zst"
    },
    overseerr = {
      cores       = 1
      memory      = 2048
      description = "Media request management tool for Plex and Jellyfin."
      tags        = "lxc;media"
      vmid        = 108
      rootfs_size = "10G"
      shared_path = "/mnt/hdd14/data/"
      ostemplate  = "local:vztmpl/debian-12-standard_12.2-1_amd64.tar.zst"
    },
    flaresolverr = {
      cores       = 1
      memory      = 2048
      description = "Proxy for bypassing Cloudflare's anti-bot page."
      tags        = "lxc;media"
      vmid        = 109
      rootfs_size = "10G"
      shared_path = "/mnt/hdd14/data/"
      ostemplate  = "local:vztmpl/debian-12-standard_12.2-1_amd64.tar.zst"
    },
    tautulli = {
      cores       = 1
      memory      = 2048
      description = "Plex monitoring tool to track your media server's usage."
      tags        = "lxc;media"
      vmid        = 110
      rootfs_size = "10G"
      shared_path = "/mnt/hdd14/data/"
      ostemplate  = "local:vztmpl/debian-12-standard_12.2-1_amd64.tar.zst"
    },
    calibre_web = {
      cores       = 1
      memory      = 2048
      description = "Web-based interface for Calibre, a free and open-source e-book manager."
      tags        = "lxc;media"
      vmid        = 111
      rootfs_size = "10G"
      shared_path = "/mnt/hdd14/data/"
      ostemplate  = "local:vztmpl/debian-12-standard_12.2-1_amd64.tar.zst"
    },
    kavita = {
      cores       = 1
      memory      = 2048
      description = "Self-hosted eBook and comic book server."
      tags        = "lxc;media"
      vmid        = 112
      rootfs_size = "10G"
      shared_path = "/mnt/hdd14/data/"
      ostemplate  = "local:vztmpl/debian-12-standard_12.2-1_amd64.tar.zst"
    },
    qbittorrent = {
      cores       = 1
      memory      = 2048
      description = "Open-source BitTorrent client with a web interface."
      tags        = "lxc;media"
      vmid        = 113
      rootfs_size = "10G"
      shared_path = "/mnt/hdd14/data/"
      ostemplate  = "local:vztmpl/debian-12-standard_12.2-1_amd64.tar.zst"
    },
    homepage = {
      cores       = 1
      memory      = 2048
      description = "Personal homepage generator."
      tags        = "lxc;media"
      vmid        = 114
      rootfs_size = "10G"
      shared_path = "/mnt/hdd14/data/"
      ostemplate  = "local:vztmpl/debian-12-standard_12.2-1_amd64.tar.zst"
    },
    gotify = {
      cores       = 1
      memory      = 2048
      description = "Self-hosted notification service."
      tags        = "lxc;media"
      vmid        = 115
      rootfs_size = "10G"
      shared_path = "/mnt/hdd14/data/"
      ostemplate  = "local:vztmpl/debian-12-standard_12.2-1_amd64.tar.zst"
    }
  }
}

# Network
variable "network" {
  type = object({
    name     = string
    bridge   = string
    gw       = string
    firewall = bool
  })
  default = {
    name     = "eth0"
    bridge   = "vmbr0"
    gw       = "192.168.1.1"
    firewall = false
  }
}

variable "dns_servers" {
  type        = list(string)
  description = "List of DNS servers"
  default     = ["1.1.1.1", "8.8.8.8"]
}

# Proxmox
variable "proxmox_node" {
  description = "Node used for all kind of services related to media"
  type        = string
  default     = "joeflix"
}

variable "proxmox_api_url" {
  description = "Address to reach proxmox's GUI"
  type        = string
}

variable "proxmox_user" {
  description = "Proxmox user (include realm like user@pam)"
  type        = string
  sensitive   = true
}

variable "proxmox_password" {
  description = "Proxmox password"
  type        = string
  sensitive   = true
}

variable "template" {
  description = "LXC template to use"
  type        = string
  default     = "local:vztmpl/debian-12-standard_12.2-1_amd64.tar.zst"
}

# Storage
variable "rootfs" {
  description = "File system and storage configuration"
  type = object({
    storage = string
    size    = string
  })
  default = {
    storage = "local-lvm"
    size    = "5G"
  }
}
