# JoeFlix: Media Server Project on Proxmox

JoeFlix is a self-hosted media server ecosystem designed to automate the deployment and management of multiple media-related services using Proxmox, Terraform, and Ansible. It integrates hardware transcoding, localized media, and a seamless user experience for both personal use and external sharing.

---

## Table of Contents

- [JoeFlix: Media Server Project on Proxmox](#joeflix-media-server-project-on-proxmox)
  - [Table of Contents](#table-of-contents)
  - [Overview](#overview)
  - [Features](#features)
  - [Architecture](#architecture)
    - [Proxmox LXC Containers](#proxmox-lxc-containers)
  - [Prerequisites](#prerequisites)
  - [Setup Instructions](#setup-instructions)
    - [Proxmox Setup](#proxmox-setup)
    - [Infrastructure Deployment](#infrastructure-deployment)
    - [Service Ports](#service-ports)
  - [Storage Structure](#storage-structure)
  - [Backup Strategy](#backup-strategy)
  - [Troubleshooting](#troubleshooting)
  - [Key Features](#key-features)
  - [Security](#security)
  - [Development](#development)
  - [Quick Start](#quick-start)
  - [License](#license)

---

## Overview

JoeFlix is built on **Proxmox Virtual Environment** to host a suite of media services, each running in its own lightweight LXC container. The stack leverages **Terraform** for infrastructure provisioning and **Ansible** for configuration management.

This project is designed with automation and maintainability in mind, ensuring efficient deployment and seamless updates for media libraries and services.

---

## Features

- **Automated Deployment**: Fully automated provisioning and configuration using Terraform and Ansible.
- **Hardware Transcoding**: Leverages Intel QSV for efficient media transcoding in Plex.
- **Localized Media**: Supports French audio and subtitles for media files.
- **Self-Contained Services**: Each service is hosted in its dedicated LXC container for isolation.
- **Custom Metadata**: Plex libraries configured for detailed metadata and thumbnails.
- **Scalability**: Modular design allows easy addition of new services or containers.
- **External Access**: Securely exposes Plex externally for remote usage.
- **Resource Optimization**: Uses a mix of SSD (for container storage) and HDD (for media storage).

---

## Architecture

### Proxmox LXC Containers
The services are hosted on the following containers with their respective IPs:

| Service         | IP Address       | Description                     |
|-----------------|------------------|---------------------------------|
| Plex            | 192.168.1.101   | Media server with hardware transcoding. |
| Radarr          | 192.168.1.102   | Movie management.               |
| Sonarr          | 192.168.1.103   | TV show management.             |
| Bazarr          | 192.168.1.104   | Subtitle management.            |
| Lidarr          | 192.168.1.105   | Music management.               |
| Prowlarr        | 192.168.1.106   | Indexer aggregator.             |
| Readarr         | 192.168.1.107   | Book management.                |
| Overseerr       | 192.168.1.108   | Request management for Plex.    |
| FlareSolverr    | 192.168.1.109   | Captcha resolver for Prowlarr.  |
| Tautulli        | 192.168.1.110   | Plex usage monitoring.          |
| Calibre-Web     | 192.168.1.111   | eBook library management.       |
| Kavita          | 192.168.1.112   | Manga/comic library management. |
| qBittorrent     | 192.168.1.113   | Torrent client.                 |
| Homepage        | 192.168.1.114   | Dashboard for all services.     |
| Gotify          | 192.168.1.115   | Notification service.           |

---

## Prerequisites

1. **Proxmox VE** installed and configured.
2. OpenTofu (Terraform fork) v1.9.0+ installed on your local machine.
3. Ansible installed on your local machine or control node.
4. A server with (my current setup):
   - 14TB HDD for media storage.
   - 800GB NVMe SSD for container storage.
   - 48GB RAM or more.
   - 4 CPU threads or more.
5. Intel processor with QSV support for Plex hardware transcoding.

---

## Setup Instructions

### Proxmox Setup

1. Install Proxmox on your server
2. Configure network for static IPs
3. Create storage pools:
   - `local-lvm`: for container storage (SSD)
   - `/mnt/hdd14/data/media`: for media storage (HDD)
4. Enable hardware transcoding in BIOS/UEFI

### Infrastructure Deployment

1. Clone the repository:

```bash
git clone https://github.com/yourusername/joeflix.git
cd joeflix
```

2. Configure environment:
```bash
cd opentofu/joeflix_containers
cp secrets.auto.tfvars.example secrets.auto.tfvars
vim secrets.auto.tfvars  # Edit with your credentials
```

3. Deploy infrastructure:
```bash
tofu init
tofu apply
```

4. Configure services:
```bash
cd ../../ansible
ansible-playbook main.yml
```

### Service Ports

| Service      | Port  | Description                    |
|--------------|-------|--------------------------------|
| Plex         | 32400 | Main interface                 |
| Radarr       | 7878  | Movie management              |
| Sonarr       | 8989  | TV show management            |
| Bazarr       | 6767  | Subtitle management           |
| Lidarr       | 8686  | Music management              |
| Prowlarr     | 9696  | Indexer management            |
| Readarr      | 8787  | Book management               |
| Overseerr    | 5055  | Request management            |
| FlareSolverr | 8191  | Proxy service                 |
| Tautulli     | 8181  | Plex monitoring               |
| Calibre-Web  | 8083  | eBook management              |
| Kavita       | 5000  | Comic/manga management        |
| qBittorrent  | 8090  | Torrent client                |
| Homepage     | 3000  | Dashboard                     |
| Gotify       | 8080  | Notifications                 |

---

## Storage Structure

```
/mnt/hdd14/data/
├── media/
│   ├── movies/
│   ├── tv/
│   ├── music/
│   ├── books/
│   └── comics/
└── downloads/
    ├── movies/
    ├── tv/
    └── music/
```

---

## Backup Strategy

1. **Container Backups**:
   - Weekly automated backups using Proxmox backup feature
   - Retention: 4 weeks

2. **Media Backups**:
   - Important configuration files backed up daily
   - Media files excluded from backup (too large)

---

## Troubleshooting

Common issues and solutions:

1. **Hardware Transcoding Issues**:
   - Verify `/dev/dri` is mounted in Plex container
   - Check Intel drivers are properly installed

2. **Network Connectivity**:
   - Verify container IP assignments
   - Check firewall rules
   - Ensure DNS resolution works

3. **Storage Issues**:
   - Check mount permissions
   - Verify storage pools are properly mounted

---

## Key Features

- Intel QSV hardware transcoding
- French media localization
- NordVPN integration for qBittorrent
- Automatic media organization
- Cross-service integration
- Centralized notification system
- Container-level isolation
- Automated deployment

---

## Security

- Unprivileged LXC containers
- NordVPN for secure downloads
- Service-specific credentials
- Network isolation

---

## Development

Built with:
- OpenTofu (Terraform fork)
- Ansible
- Proxmox LXC
- Debian 12/Ubuntu 22.04 base images

---

## Quick Start


The project includes a Makefile for easy management. Here are the available commands:

```bash
# Initialize the project
make init

# Plan infrastructure changes
make plan

# Apply infrastructure changes
make apply

# Update all services
make update

# Create a backup
make backup

# Edit vault secrets
make vault-edit

# Clean temporary files
make clean

# Run Ansible installation
make ansible-install
```

For a full list of available commands:
```bash
make help
```

---

## License

MIT

---
