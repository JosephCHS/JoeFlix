module "plex_lxc" {
  source = "./lxc"
  providers = {
    proxmox = proxmox
  }
  instance_number = var.plex_container_id
  hostname = "plex"
  rootfs = {
    storage = "local-zfs"
    size = "500G"
  }
  mountpoint = {
    mp = "/shared"
    storage = "media"
    volume = "/mnt/hdd14/data/media/"
    size = "0G"
    slot = "0"
    key = 0
  }
  password_lxc = var.password_lxc_plex
  cpu_cores = 4
  memory = 30000
  network = var.network
  tags = "lxc;media"
}

module "radarr_lxc" {
  source = "./lxc"
  providers = {
    proxmox = proxmox
  }
  instance_number = var.radarr_container_id
  hostname = "radarr"
  rootfs = {
    storage = "local-zfs"
    size = "10G"
  }
  mountpoint = {
    mp = "/shared"
    storage = "media"
    volume = "/mnt/hdd14/data/"
    size = "0G"
    slot = "0"
    key = 0
  }
  password_lxc = var.password_lxc
  cpu_cores = 1
  memory = 2048
  network = var.network
  tags = "lxc;media"
}

module "cloudflared_lxc" {
  source = "./lxc"
  providers = {
    proxmox = proxmox
  }
  instance_number = var.cloudflared_container_id
  hostname = "cloudflared"
  rootfs = {
    storage = "local-zfs"
    size = "2G"
  }
  password_lxc = var.password_lxc
  cpu_cores = "1"
  memory = 512
  network = var.network
  tags = "lxc;network"
}

module "flaresolverr_lxc" {
  source = "./lxc"
  providers = {
    proxmox = proxmox
  }  
  instance_number = var.flaresolverr_container_id
  hostname = "flaresolverr"
  rootfs = {
    storage = "local-zfs"
    size = "4G"
  }
  password_lxc = var.password_lxc
  cpu_cores = "2"
  memory = 2048
  network = var.network
  tags = "lxc;network"
}

module "bazarr_lxc" {
  source = "./lxc"
  providers = {
    proxmox = proxmox
  }  
  instance_number = var.bazarr_container_id
  hostname = "bazarr"
  rootfs = {
    storage = "local-zfs"
    size = "4G"
  }
  mountpoint = {
    mp = "/shared"
    storage = "media"
    volume = "/mnt/hdd14/data/"
    size = "0G"
    slot = "0"
    key = 0
  }
  password_lxc = var.password_lxc
  cpu_cores = "2"
  memory = 1024
  network = var.network
  tags = "lxc;media"
}

module "calibre_web_lxc" {
  source = "./lxc"
  providers = {
    proxmox = proxmox
  }
  instance_number = var.calibre_web_container_id
  hostname = "calibre-web"
  rootfs = {
    storage = "local-zfs"
    size = "4G"
  }
  mountpoint = {
    mp = "/shared"
    storage = "media"
    volume = "/mnt/hdd14/data/media/books"
    size = "0G"
    slot = "0"
    key = 0
  }
  password_lxc = var.password_lxc
  cpu_cores = "2"
  memory = 2048
  network = var.network
  tags = "lxc;media"
}

module "lidarr_lxc" {
  source = "./lxc"
  providers = {
    proxmox = proxmox
  }  
  instance_number = var.lidarr_container_id
  hostname = "lidarr"
  rootfs = {
    storage = "local-zfs"
    size = "4G"
  }
  mountpoint = {
    mp = "/shared"
    storage = "media"
    volume = "/mnt/hdd14/data/"
    size = "0G"
    slot = "0"
    key = 0
  }
  password_lxc = var.password_lxc
  cpu_cores = "2"
  memory = 1024
  network = var.network
  tags = "lxc;media"
}

module "overseerr_lxc" {
  source = "./lxc"
  providers = {
    proxmox = proxmox
  } 
  instance_number = var.overseerr_container_id
  hostname = "overseerr"
  rootfs = {
    storage = "local-zfs"
    size = "8G"
  }
  password_lxc = var.password_lxc
  cpu_cores = "3"
  memory = 4096
  network = var.network
  tags = "lxc;media"
}

module "prowlarr_lxc" {
  source = "./lxc"
  providers = {
    proxmox = proxmox
  } 
  instance_number = var.prowlarr_container_id
  hostname = "prowlarr"
  rootfs = {
    storage = "local-zfs"
    size = "4G"
  }
  password_lxc = var.password_lxc
  cpu_cores = "2"
  memory = 2048
  network = var.network
  tags = "lxc;media"
}

module "readarr_lxc" {
  source = "./lxc"
  providers = {
    proxmox = proxmox
  }  
  instance_number = var.readarr_container_id
  hostname = "readarr"
  rootfs = {
    storage = "local-zfs"
    size = "4G"
  }
  mountpoint = {
    mp = "/shared"
    storage = "media"
    volume = "/mnt/hdd14/data/"
    size = "0G"
    slot = "0"
    key = 0
  }
  password_lxc = var.password_lxc
  cpu_cores = "2"
  memory = 2048
  network = var.network
  tags = "lxc;media"
}

module "sonarr_lxc" {
  source = "./lxc"
  providers = {
    proxmox = proxmox
  } 
  instance_number = var.sonarr_container_id
  hostname = "sonarr"
  rootfs = {
    storage = "local-zfs"
    size = "5G"
  }
  mountpoint = {
    mp = "/shared"
    storage = "media"
    volume = "/mnt/hdd14/data/"
    size = "0G"
    slot = "0"
    key = 0
  }
  password_lxc = var.password_lxc
  cpu_cores = "2"
  memory = 2048
  network = var.network 
  tags = "lxc;media"
}

module "tautulli_lxc" {
  source = "./lxc"
  providers = {
    proxmox = proxmox
  }
  instance_number = var.tautulli_container_id
  hostname = "tautulli"
  rootfs = {
    storage = "local-zfs"
    size = "4G"
  }
  password_lxc = var.password_lxc
  cpu_cores = "2"
  memory = 1024
  network = var.network
  tags = "lxc;media"
}

module "kavita_lxc" {
  source = "./lxc"
  providers = {
    proxmox = proxmox
  } 
  instance_number = var.kavita_container_id
  hostname = "kavita"
  rootfs = {
    storage = "local-zfs"
    size = "10G"
  }
  mountpoint = {
    mp = "/shared"
    storage = "media"
    volume = "/mnt/hdd14/data/media/books"
    size = "0G"
    slot = "0"
    key = 0
  }  
  password_lxc = var.password_lxc
  cpu_cores = "2"
  memory = 4096
  network = var.network
  tags = "lxc;media"
}

module "homepage_lxc" {
  source = "./lxc"
  providers = {
    proxmox = proxmox
  } 
  instance_number = var.homepage_container_id
  hostname = "homepage"
  rootfs = {
    storage = "local-zfs"
    size = "3G"
  }
  password_lxc = var.password_lxc
  cpu_cores = "1"
  memory = 1024
  network = var.network 
  tags = "lxc;dashboard"
}

module "qbittorrent_lxc" {
  source = "./lxc"
  providers = {
    proxmox = proxmox
  }
  instance_number = var.qbittorrent_container_id
  hostname = "qbittorrent"
  rootfs = {
    storage = "local-zfs"
    size = "10G"
  }
  mountpoint = {
    mp = "/shared"
    storage = "media"
    volume = "/mnt/hdd14/data/torrents"
    size = "0G"
    slot = "0"
    key = 0
  }
  password_lxc = var.password_lxc
  cpu_cores = "3"
  memory = 6000
  network = var.network 
  tags = "lxc;media"
}

module "gotify_lxc" {
  source = "./lxc"
  providers = {
    proxmox = proxmox
  }
  instance_number = var.gotify_container_id
  hostname = "gotify"
  rootfs = {
    storage = "local-zfs"
    size = "2G"
  }
  password_lxc = var.password_lxc
  cpu_cores = 1
  memory = 1024
  network = var.network
  tags = "lxc;communication"
}