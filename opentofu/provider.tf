provider "proxmox" {
  pm_debug = true
  pm_api_url = var.proxmox_api_url
  pm_password = var.proxmox_password
  pm_user = var.proxmox_user
  pm_tls_insecure = true
}