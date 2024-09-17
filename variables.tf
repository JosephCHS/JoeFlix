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

variable "gotify_container_id" {
  description = "Unique ID for the container. Also used as the last octet of the IP address."
  type = number
  default = 115
}

variable "token_secret" {
  description = "A secret token used by Terraform Provider to reach JoeFlix Proxmox."
  type = string
}

variable "token_id" {
  description = "Token ID used by Terraform Provider to reach JoeFlix Proxmox."
  type = string
}

variable "password_lxc" {
  description = "Password for private LXC container which are not exposed to Internet."
  type = string
}

variable "password_lxc_plex" {
  description = "Password for public LXC container which are exposed to Internet."
  type = string
}