# Interview Tasks

This repository contains Ansible playbooks and roles for setting up Docker, Nginx, and Rsyslog services. The project is structured to automate the deployment and configuration of these services using Ansible.

## Project Structure


### Ansible Configuration

- **ansible.cfg**: Configuration file for Ansible.
- **hosts.yml**: Inventory file defining the hosts.

### Playbooks

- **playbooks/docker.yaml**: Playbook for setting up Docker.
- **playbooks/nginx.yml**: Playbook for setting up Nginx.
- **playbooks/rsyslog.yml**: Playbook for setting up Rsyslog.

### Roles

#### Docker Setup

- **defaults/main.yml**: Default variables for Docker setup.
- **tasks/config.yml**: Tasks for configuring Docker.
- **tasks/install.yml**: Tasks for installing Docker.
- **tasks/main.yml**: Main task file for Docker setup.
- **templates/daemon.j2**: Jinja2 template for Docker daemon configuration.

**Explanation**: This role installs Docker on the target machine, configures it using the provided settings, and ensures that the Docker service is running.

#### Nginx

- **defaults/main.yml**: Default variables for Nginx setup.
- **tasks/main.yml**: Main task file for Nginx setup.
- **templates/app.j2**: Jinja2 template for Nginx configuration.

**Explanation**: This role installs Nginx on the target machine, configures it using the provided settings, and ensures that the Nginx service is running.

#### Rsyslog Service

- **defaults/main.yml**: Default variables for Rsyslog setup.
- **tasks/main.yml**: Main task file for Rsyslog setup.

**Explanation**: This role installs Rsyslog on the target machine, configures it using the provided settings, and ensures that the Rsyslog service is running.

### Task2

- **compose.yml**: Docker Compose file.
- **log_sender.service**: Systemd service file for log sender.
- **log_sender.sh**: Shell script for log sender.
- **logstash/pipeline/**: Directory for Logstash pipeline configuration.
- **rsyslog/Dockerfile**: Dockerfile for Rsyslog.
- **rsyslog/log.conf**: Configuration file for Rsyslog.

**Explanation**: This directory contains additional configurations and scripts for setting up a logging infrastructure using Docker Compose, Logstash, and Rsyslog.

#### Docker Compose

- **compose.yml**: Defines the services, networks, and volumes for the logging infrastructure. It includes configurations for Logstash and Rsyslog containers.

**Explanation**: This file orchestrates the deployment of multiple Docker containers, ensuring they are correctly configured and connected.

#### Dockerfile

- **rsyslog/Dockerfile**: Defines the steps to build a Docker image for Rsyslog.

**Explanation**: This file contains the instructions to build a Docker image for Rsyslog, including installing necessary packages and copying configuration files.

## Usage

1. Clone the repository:
    ```sh
    git clone https://github.com/yourusername/interview_tasks.git
    cd interview_tasks
    ```

2. Update the inventory file `hosts.yml` with your server details.

3. Run the desired playbook:
    ```sh
    ansible-playbook -i hosts.yml playbooks/nginx.yml
    ```


Note:
To use the ftp server on /var/log : lftp ftp://rsyslog:StrongPassword1@24.144.66.248