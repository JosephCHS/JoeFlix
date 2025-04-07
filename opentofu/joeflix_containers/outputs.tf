output "container_ips" {
  description = "IP addresses of all created containers"
  value = {
    for name, container in proxmox_lxc.containers : name => container.network[0].ip
  }
}

output "container_states" {
  description = "Current state of all containers"
  value = {
    for name, container in proxmox_lxc.containers : name => container.status
  }
}

output "container_ids" {
  description = "VMID of all containers"
  value = {
    for name, container in proxmox_lxc.containers : name => container.vmid
  }
}

output "ansible_inventory" {
  description = "Ansible-compatible inventory string for all containers"
  value = join("\n", [
    for name, container in proxmox_lxc.containers : "${name} ansible_host=${split("/", container.network[0].ip)[0]}"
  ])
}
