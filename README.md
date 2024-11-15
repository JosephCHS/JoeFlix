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
    - [Terraform Setup](#terraform-setup)
    - [Ansible Configuration](#ansible-configuration)
    - [Post-Provisioning Tasks](#post-provisioning-tasks)
    - [Services](#services)
    - [Technical Details](#technical-details)
    - [Backup and Retention](#backup-and-retention)
    - [Usage](#usage)
    - [Future Enhancements](#future-enhancements)
    - [Contributing](#contributing)
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
2. Terraform installed on your local machine.
3. Ansible installed on your local machine or control node.
4. A server with:
   - 14TB HDD for media storage.
   - 800GB NVMe SSD for container storage.
   - 48GB RAM or more.
   - 4 CPU threads.
5. Intel processor with QSV support for Plex hardware transcoding.

---

## Setup Instructions

### Proxmox Setup

1. Install Proxmox on your server.
2. Ensure your network is properly configured for static IPs.
3. Create a storage pool for containers (`local-lvm`) and media (`/mnt/hdd14/data/media`).

### Terraform Setup

1. Clone the repository:
   ```bash
   git clone https://github.com/JosephCHS/JoeFlix
   cd JoeFlix
    ```

2. Initialize Terraform:
    ```bash
    terraform init
    ```

3. Customize the `main.tf` to match your Proxmox configuration.

4. Deploy the LXC containers:
    ```bash
    terraform apply
    ```

### Ansible Configuration

1. Ensure the `hosts.yml` file reflects the IP addresses of your containers.
2. Execute the playbook:
    ```bash
    ansible-playbook main.yml
    ```
    
### Post-Provisioning Tasks

1. Mount `/dev/dri` in the Plex LXC for hardware transcoding.
2. Assign correct file permissions on /mnt/hdd14/data/media.

------------------------------

### Services
Each service is deployed with optimized configurations for its role. Notable setups include:

* Plex: Libraries for Movies (`/shared/movies`), Series (`/shared/series`), and Music (`/shared/music`).
* Radarr/Sonarr: Configured for French audio/subtitles when available.
* Bazarr: Handles subtitle downloads and synchronization.
* qBittorrent: Integrated with Sonarr and Radarr for automated downloading.
* Homepage: Provides a centralized dashboard for easy access to all services.

------------------------------

### Technical Details
* UID/GID Mapping: Ensures consistency across host and containers, using UID `1000` and GID `1000`.
* QSV Hardware Transcoding: Configured for Plex with proper group memberships (video and render).
* Terraform Null Resources: Used to execute Ansible playbooks after container creation.

------------------------------

### Backup and Retention
JoeFlix prioritizes media availability over backup, given the non-critical nature of the data. However:

* Media Files: No backups; files can be re-downloaded.
* Critical Configurations: Backup essential configurations (Terraform, Ansible) externally.

------------------------------

### Usage
* Access the dashboard via `http://192.168.1.114`.
* Configure Radarr, Sonarr, and Lidarr to manage your media libraries.
* Share Plex with external users using the configured external access.

### Future Enhancements

* Enable container monitoring and alerts.
* Automate arr services setup, especially the part with their secret API

### Contributing
Contributions are welcome! Please submit a pull request or open an issue for any suggestions or bugs.

### License
This project is licensed under the MIT License. See the LICENSE file for details.
