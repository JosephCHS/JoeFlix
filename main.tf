module "plex_lxc" {
  source = "./lxc"
  vmid = var.plex_container_id
  hostname = "plex"
  rootfs = {size = "500G"}
  cpu_cores = 4
  memory = 30000
  network = var.network
  tags = "lxc;media"
}

module "radarr_lxc" {
  source = "./lxc" 
  vmid = var.radarr_container_id
  hostname = "radarr"
  disk_size = "10G"
  cpu_cores = 1
  memory = 2048
  network = var.network
  tags = "lxc;media"
}

module "cloudflared_lxc" {
  source = "./lxc"
  vmid = 10
  hostname = "cloudflared"
  disk_size = "2G"
  cpu_cores = "1"
  memory = 512
  network = var.network
  tags = "lxc;network"
}

module "flaresolverr_lxc" {
  source = "./lxc"
  vmid = 10
  hostname = "flaresolverr"
  disk_size = "4G"
  cpu_cores = "2"
  memory = 2048
  network = var.network
  tags = "lxc;network"
}

module "bazarr_lxc" {
  source = "./lxc"
  vmid = 10
  hostname = "bazarr"
  disk_size = "4G"
  cpu_cores = "2"
  memory = 1024
  network = var.network
  tags = "lxc;media"
}

module "calibre_web_lxc" {
  source = "./lxc"
  vmid = 10
  hostname = "calibre-web"
  disk_size = "4G"
  cpu_cores = "2"
  memory = 2048
  network = var.network
  tags = "lxc;media"
}

module "lidarr_lxc" {
  source = "./lxc"
  vmid = 10
  hostname = "lidarr"
  disk_size = "4G"
  cpu_cores = "2"
  memory = 1024
  network = var.network
  tags = "lxc;media"
}

module "overseerr_lxc" {
  source = "./lxc"
  vmid = 10
  hostname = "overseerr"
  disk_size = "8G"
  cpu_cores = "3"
  memory = 4096
  network = var.network
  tags = "lxc;media"
}

module "prowlarr_lxc" {
  source = "./lxc"
  vmid = 10
  hostname = "prowlarr"
  disk_size = "4G"
  cpu_cores = "2"
  memory = 2048
  network = var.network
  tags = "lxc;media"
}

module "readarr_lxc" {
  source = "./lxc"
  vmid = 10
  hostname = "readarr"
  disk_size = "4G"
  cpu_cores = "2"
  memory = 2048
  network = var.network
  tags = "lxc;media"
}

module "sonarr_lxc" {
  source = "./lxc"
  vmid = 10
  hostname = "sonarr"
  disk_size = "5G"
  cpu_cores = "2"
  memory = 2048
  network = var.network 
  tags = "lxc;media"
}

module "tautulli_lxc" {
  source = "./lxc"
  vmid = 10
  hostname = "tautulli"
  disk_size = "4G"
  cpu_cores = "2"
  memory = 1024
  network = var.network
  tags = "lxc;media"
}

module "kavita_lxc" {
  source = "./lxc"
  vmid = 10
  hostname = "kavita"
  disk_size = "10G"
  cpu_cores = "2"
  memory = 4096
  network = var.network
  tags = "lxc;media"
}

module "homepage_lxc" {
  source = "./lxc"
  vmid = 10
  hostname = "homepage"
  disk_size = "3G"
  cpu_cores = "1"
  memory = 1024
  network = var.network 
  tags = "lxc;dashboard"
}

module "jackett_lxc" {
  source = "./lxc"
  vmid = 10
  hostname = "jackett"
  disk_size = "2G"
  cpu_cores = "1"
  memory = 1024
  network = var.network 
  tags = "lxc;media"
}

module "qbittorrent_lxc" {
  source = "./lxc"
  vmid = 10
  hostname = "qbittorrent"
  disk_size = "10G"
  cpu_cores = "3"
  memory = 6000
  network = var.network 
  tags = "lxc;media"
}

module "gotify_lxc" {
  source = "./tteck_lxc_module"
  hostname = "gotify"
  disk_size = "2G"
  cpu_cores = 1
  memory = 1024
  network = var.network
  tags = "lxc;communication"
}
