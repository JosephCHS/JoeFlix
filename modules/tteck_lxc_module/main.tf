
module "cloudflared_lxc" {
  source      = "./modules/lxc"
  hostname    = "cloudflared"
  disk_size   = "2G"
  cpu_cores   = "1"
  memory      = "512M"
  template    = "debian-12-standard"
  network     = {
    nic_name = var.nic_name, 
    ip = format("192.168.1.%d/24", proxmox_lxc.cloudflared.vmid) 
  }
  dns_servers = ["1.1.1.1", "8.8.8.8"]
}

module "flaresolverr_lxc" {
  source      = "./modules/lxc"
  hostname    = "flaresolverr"
  disk_size   = "2G"
  cpu_cores   = "1"
  memory      = "512M"
  template    = "debian-12-standard"
  vlan        = var.vlan_num
  network     = { nic_name = var.nic_name, ip = "192.168.1.2" }
  dns_servers = ["1.1.1.1", "8.8.8.8"]
}

module "bazarr_lxc" {
  source      = "./modules/lxc"
  hostname    = "bazarr"
  disk_size   = "2G"
  cpu_cores   = "2"
  memory      = "1G"
  template    = "debian-12-standard"
  vlan        = var.vlan_num
  network     = { nic_name = var.nic_name, ip = "192.168.1.3" }
  dns_servers = ["1.1.1.1", "8.8.8.8"]
}

module "calibre_web_lxc" {
  source      = "./modules/lxc"
  hostname    = "calibre-web"
  disk_size   = "3G"
  cpu_cores   = "2"
  memory      = "1G"
  template    = "debian-12-standard"
  vlan        = var.vlan_num
  network     = { nic_name = var.nic_name, ip = "192.168.1.4" }
  dns_servers = ["1.1.1.1", "8.8.8.8"]
}

module "lidarr_lxc" {
  source      = "./modules/lxc"
  hostname    = "lidarr"
  disk_size   = "3G"
  cpu_cores   = "2"
  memory      = "1G"
  template    = "debian-12-standard"
  vlan        = var.vlan_num
  network     = { nic_name = var.nic_name, ip = "192.168.1.5" }
  dns_servers = ["1.1.1.1", "8.8.8.8"]
}

module "overseerr_lxc" {
  source      = "./modules/lxc"
  hostname    = "overseerr"
  disk_size   = "3G"
  cpu_cores   = "2"
  memory      = "1G"
  template    = "debian-12-standard"
  vlan        = var.vlan_num
  network     = { nic_name = var.nic_name, ip = "192.168.1.6" }
  dns_servers = ["1.1.1.1", "8.8.8.8"]
}

module "plex_media_server_lxc" {
  source      = "./modules/lxc"
  hostname    = "plex"
  disk_size   = "20G"
  cpu_cores   = "4"
  memory      = "4G"
  template    = "debian-12-standard"
  vlan        = var.vlan_num
  network     = { nic_name = var.nic_name, ip = "192.168.1.7" }
  dns_servers = ["1.1.1.1", "8.8.8.8"]
}

module "prowlarr_lxc" {
  source      = "./modules/lxc"
  hostname    = "prowlarr"
  disk_size   = "2G"
  cpu_cores   = "2"
  memory      = "1G"
  template    = "debian-12-standard"
  vlan        = var.vlan_num
  network     = { nic_name = var.nic_name, ip = "192.168.1.8" }
  dns_servers = ["1.1.1.1", "8.8.8.8"]
}

module "radarr_lxc" {
  source      = "./modules/lxc"
  hostname    = "radarr"
  disk_size   = "5G"
  cpu_cores   = "2"
  memory      = "2G"
  template    = "debian-12-standard"
  vlan        = var.vlan_num
  network     = { nic_name = var.nic_name, ip = "192.168.1.9" }
  dns_servers = ["1.1.1.1", "8.8.8.8"]
}

module "readarr_lxc" {
  source      = "./modules/lxc"
  hostname    = "readarr"
  disk_size   = "3G"
  cpu_cores   = "2"
  memory      = "1G"
  template    = "debian-12-standard"
  vlan        = var.vlan_num
  network     = { nic_name = var.nic_name, ip = "192.168.1.10" }
  dns_servers = ["1.1.1.1", "8.8.8.8"]
}

module "sonarr_lxc" {
  source      = "./modules/lxc"
  hostname    = "sonarr"
  disk_size   = "5G"
  cpu_cores   = "2"
  memory      = "2G"
  template    = "debian-12-standard"
  vlan        = var.vlan_num
  network     = { nic_name = var.nic_name, ip = "192.168.1.11" }
  dns_servers = ["1.1.1.1", "8.8.8.8"]
}

module "tautulli_lxc" {
  source      = "./modules/lxc"
  hostname    = "tautulli"
  disk_size   = "2G"
  cpu_cores   = "2"
  memory      = "1G"
  template    = "debian-12-standard"
  vlan        = var.vlan_num
  network     = { nic_name = var.nic_name, ip = "192.168.1.12" }
  dns_servers = ["1.1.1.1", "8.8.8.8"]
}

module "paperless_ng_lxc" {
  source      = "./modules/lxc"
  hostname    = "paperless-ngx"
  disk_size   = "5G"
  cpu_cores   = "2"
  memory      = "2G"
  template    = "debian-12-standard"
  vlan        = var.vlan_num
  network     = { nic_name = var.nic_name, ip = "192.168.1.13" }
  dns_servers = ["1.1.1.1", "8.8.8.8"]
}

module "kavita_lxc" {
  source      = "./modules/lxc"
  hostname    = "kavita"
  disk_size   = "3G"
  cpu_cores   = "2"
  memory      = "1G"
  template    = "debian-12-standard"
  vlan        = var.vlan_num
  network     = { nic_name = var.nic_name, ip = "192.168.1.14" }
  dns_servers = ["1.1.1.1", "8.8.8.8"]
}

module "homepage_lxc" {
  source      = "./modules/lxc"
  hostname    = "homepage"
  disk_size   = "2G"
  cpu_cores   = "1"
  memory      = "512M"
  template    = "debian-12-standard"
  vlan        = var.vlan_num
  network     = { nic_name = var.nic_name, ip = "192.168.1.15" }
  dns_servers = ["1.1.1.1", "8.8.8.8"]
}

module "jackett_lxc" {
  source      = "./modules/lxc"
  hostname    = "jackett"
  disk_size   = "2G"
  cpu_cores   = "1"
  memory      = "512M"
  template    = "debian-12-standard"
  vlan        = var.vlan_num
  network     = { nic_name = var.nic_name, ip = "192.168.1.16" }
  dns_servers = ["1.1.1.1", "8.8.8.8"]
}

module "qbittorrent_lxc" {
  source      = "./modules/lxc"
  hostname    = "qbittorrent"
  disk_size   = "3G"
  cpu_cores   = "2"
  memory      = "1G"
  template    = "debian-12-standard"
  vlan        = var.vlan_num
  network     = { nic_name = var.nic_name, ip = "192.168.1.17" }
  dns_servers = ["1.1.1.1", "8.8.8.8"]
}

module "gotify_lxc" {
  source      = "./modules/lxc"
  hostname    = "gotify"
  disk_size   = "2G"
  cpu_cores   = "1"
  memory      = "512M"
  template    = "debian-12-standard"
  vlan        = var.vlan_num
  network     = { nic_name = var.nic_name, ip = "192.168.1.18" }
  dns_servers = ["1.1.1.1", "8.8.8.8"]
}
