variable "cores" {
  description = "The number of cores assigned to the container."
  type = number
  default = 1
}

variable "description" {
  description = "Sets the container description seen in the web interface."
  type = string
  default = "LXC container for JoeFlix"
}

variable "dns_servers" {
  description = "List of DNS servers."
  type = list(string)
  default = ["1.1.1.1", "8.8.8.8"]
}

variable "hostname" {
  description = "Specify the hostname of the container."
  type = string
  default = "My LXC Container"
}

variable "memory" {
  description = " A number containing the amount of RAM to assign to the container (in MB)."
  type = number
  default = 1024
}

variable "mountpoint" {
  description = "An object for defining a volume to use as a container mount point. Can be specified multiple times. Without volume defined, Proxmox will try to create a volume with the value of storage + : + size (without the trailing G) - e.g. /srv/host/bind-mount-point:256. This behaviour looks to be caused by a bug in the provider."
  type = object({
    mp = string
    storage = string
    volume = string
    slot = string
    key = number
  })
  default = {
    mp = "/shared"
    storage = "media"
    volume = "/mnt/hdd14/data"
    size = "0"
    slot = "1"
    key = 1
  }
}

variable "network" {
  description = "Network configuration, network interface name and IP."
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

variable "onboot" {
  description = "A bool that determines if the container will start on boot."
  type = bool
  default = true
}

variable "rootfs" {
  description = "File system and storage quantity allowed for LXC container."
  type = object({
    storage = string
    size = string
  })
  default = {
    storage = "local-lvm"
    size = "5G"
  }
}

variable "start" {
  description = "A boolean that determines if the container is started after creation."
  type = bool
  default = true
}

variable "swap" {
  description = "A number that sets the amount of swap memory available to the container."
  type = number
  default = 512
}

variable "tags" {
  description = "Tags of the container, semicolon-delimited. This is only meta information."
  type = string
  default = "LXC;JoeFlix"
}

variable "target_node" {
  description = "Proxmox node to be used"
  type = string
  default = "joeflix"
}

variable "template" {
  description = "LXC template to use"
  type = string
  default = "local:vztmpl/debian-12-standard_12.2-1_amd64.tar.zst"
  
}

variable "unprivileged" {
  description = "Set the global right for the LXC container"
  type = bool
  default = false
}

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

variable "qbittorrent_container_id" {
  description = "Unique ID for the container. Also used as the last octet of the IP address."
  type = number
  default = 113
}

variable "homepage_container_id" {
  description = "Unique ID for the container. Also used as the last octet of the IP address."
  type = number
  default = 114
}

variable "gotify_container_id" {
  description = "Unique ID for the container. Also used as the last octet of the IP address."
  type = number
  default = 115
}

variable "pm_password" {
  description = "(Optional; sensitive; or use environment variable PM_PASS) The password."
  type = string
  sensitive   = true
}

variable "pm_user" {
  description = "(Optional; or use environment variable PM_USER) The user, remember to include the authentication realm such as myuser@pam or myuser@pve."
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

variable "ssh_public_keys" {
  description = "Multi-line string of SSH public keys that will be added to the container. Can be defined using heredoc syntax."
  default = "NaN"
}
