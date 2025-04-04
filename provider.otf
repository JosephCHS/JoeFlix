terraform {
  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
      version = "3.0.1-rc4"
    }
  }
}

provider "proxmox" {
  pm_debug = true
  pm_api_url = var.api_url
  pm_password = var.pm_password
  pm_user = var.pm_user
  pm_tls_insecure = true
}