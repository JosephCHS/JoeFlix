variable "proxmox_host" {
    description = "Node used for all kind of services related to media like movies, series, books, but not images"
    type = string
    default = "joeflix"
}

variable "api_url" {
    description = "Adress to reach proxmox's GUI"
    type = string
    default = "https://192.168.1.12:8006/api2/json"
}

variable "network" {
  description = "Network configuration, network interface name and IP"
  type = object({
    name = string
    bridge = string
    ip = string
    gw = string
    firewall = bool
  })
  default = {
    name = "eth0"
    bridge = "vmbr0"
    ip = "192.168.1.1/24"
    gw = "192.168.1.254"
    firewall = false
  }
}

variable "instance_number" {
  description = "Unique ID for the container used for its ID and the last number of its IP address"
  type = number
  default = 101
}

variable "plex_container_id" {
  description = "Unique ID for the container. Also used as the last octet of the IP address."
  type = number
  default = 101
}

variable "radarr_container_id" {
  description = "Unique ID for the container. Also used as the last octet of the IP address."
  type = number
  default = 102
}

variable "sonarr_container_id" {
  description = "Unique ID for the container. Also used as the last octet of the IP address."
  type = number
  default = 103
}

variable "bazarr_container_id" {
  description = "Unique ID for the container. Also used as the last octet of the IP address."
  type = number
  default = 104
}

variable "lidarr_container_id" {
  description = "Unique ID for the container. Also used as the last octet of the IP address."
  type = number
  default = 105
}

variable "prowlarr_container_id" {
  description = "Unique ID for the container. Also used as the last octet of the IP address."
  type = number
  default = 106
}

variable "readarr_container_id" {
  description = "Unique ID for the container. Also used as the last octet of the IP address."
  type = number
  default = 107
}

variable "overseerr_container_id" {
  description = "Unique ID for the container. Also used as the last octet of the IP address."
  type = number
  default = 108
}

variable "flaresolverr_container_id" {
  description = "Unique ID for the container. Also used as the last octet of the IP address."
  type = number
  default = 109
}

variable "tautulli_container_id" {
  description = "Unique ID for the container. Also used as the last octet of the IP address."
  type = number
  default = 110
}

variable "calibre_web_container_id" {
  description = "Unique ID for the container. Also used as the last octet of the IP address."
  type = number
  default = 111
}

variable "kavita_container_id" {
  description = "Unique ID for the container. Also used as the last octet of the IP address."
  type = number
  default = 112
}

variable "jacket_container_id" {
  description = "Unique ID for the container. Also used as the last octet of the IP address."
  type = number
  default = 113
}

variable "qbittorrent_container_id" {
  description = "Unique ID for the container. Also used as the last octet of the IP address."
  type = number
  default = 114
}

variable "homepage_container_id" {
  description = "Unique ID for the container. Also used as the last octet of the IP address."
  type = number
  default = 115
}

variable "gotify_container_id" {
  description = "Unique ID for the container. Also used as the last octet of the IP address."
  type = number
  default = 116
}

variable "cloudflared_container_id" {
  description = "Unique ID for the container. Also used as the last octet of the IP address."
  type = number
  default = 117
}

variable "token_secret" {
  description = "A secret token used by Terraform Provider to reach JoeFlix Proxmox."
  type = string
  sensitive   = true
}

variable "token_id" {
  description = "Token ID used by Terraform Provider to reach JoeFlix Proxmox."
  type = string
  sensitive   = true
}

variable "password_lxc" {
  description = "Password for private LXC container which are not exposed to Internet."
  type = string
  sensitive = true
}

variable "password_lxc_plex" {
  description = "Password for public LXC container which are exposed to Internet."
  type = string
  sensitive = true
}