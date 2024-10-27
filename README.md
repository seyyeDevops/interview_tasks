# Interview Tasks

This repository contains Ansible playbooks and roles for setting up Docker, Nginx, and Rsyslog services. The project is structured to automate the deployment and configuration of these services using Ansible.

## Project Structure

### Ansible Configuration

- **[ansible.cfg](ansible.cfg)**: Configuration file for Ansible.
- **[hosts.yml](hosts.yml)**: Inventory file defining the hosts.

### Playbooks

- **[playbooks/docker.yaml](playbooks/docker.yaml)**: Playbook for setting up Docker.
- **[playbooks/nginx.yml](playbooks/nginx.yml)**: Playbook for setting up Nginx.
- **[playbooks/rsyslog.yml](playbooks/rsyslog.yml)**: Playbook for setting up Rsyslog.

### Roles

#### Docker Setup

- **[defaults/main.yml](roles/docker-setup/defaults/main.yml)**: Default variables for Docker setup.
- **[tasks/config.yml](roles/docker-setup/tasks/config.yml)**: Tasks for configuring Docker.
- **[tasks/install.yml](roles/docker-setup/tasks/install.yml)**: Tasks for installing Docker.
- **[tasks/main.yml](roles/docker-setup/tasks/main.yml)**: Main task file for Docker setup.
- **[templates/daemon.j2](roles/docker-setup/templates/daemon.j2)**: Jinja2 template for Docker daemon configuration.

**Explanation**: This role installs Docker on the target machine, configures it using the provided settings, and ensures that the Docker service is running.

#### Nginx

- **[defaults/main.yml](roles/nginx/defaults/main.yml)**: Default variables for Nginx setup.
- **[files/.htpasswd](roles/nginx/files/.htpasswd)**: Password file for basic authentication.
- **[tasks/main.yml](roles/nginx/tasks/main.yml)**: Main task file for Nginx setup.
- **[templates/app.j2](roles/nginx/templates/app.j2)**: Jinja2 template for Nginx application configuration.
- **[templates/compose.j2](roles/nginx/templates/compose.j2)**: Jinja2 template for Docker Compose configuration.

**Explanation**: This role installs Nginx on the target machine, configures it using the provided settings, and ensures that the Nginx service is running.

#### Rsyslog Service

- **[defaults/main.yml](roles/rsyslog-service/defaults/main.yml)**: Default variables for Rsyslog setup.
- **[files/log/](roles/rsyslog-service/files/log/)**: Directory for log files.
- **[handlers/main.yml](roles/rsyslog-service/handlers/main.yml)**: Handlers for Rsyslog service.
- **[tasks/main.yml](roles/rsyslog-service/tasks/main.yml)**: Main task file for Rsyslog setup.
- **[templates/](roles/rsyslog-service/templates/)**: Directory for Jinja2 templates.

**Explanation**: This role installs Rsyslog on the target machine, configures it using the provided settings, and ensures that the Rsyslog service is running.

### Scripts

- **[rpm_nginx.sh](rpm_nginx.sh)**: Shell script for RPM-based Nginx installation.

### Task2

- **[compose.yml](task2/compose.yml)**: Docker Compose file.
- **[log_sender.service](task2/log_sender.service)**: Systemd service file for log sender.
- **[log_sender.sh](task2/log_sender.sh)**: Shell script for log sender.
- **[logstash/pipeline/](task2/logstash/pipeline/)**: Directory for Logstash pipeline configuration.
- **[rsyslog/Dockerfile](task2/rsyslog/Dockerfile)**: Dockerfile for Rsyslog.
- **[rsyslog/log.conf](task2/rsyslog/log.conf)**: Configuration file for Rsyslog.

**Explanation**: This directory contains additional configurations and scripts for setting up a logging infrastructure using Docker Compose, Logstash, and Rsyslog.

#### Docker Compose

- **[compose.yml](task2/compose.yml)**: Defines the services, networks, and volumes for the logging infrastructure. It includes configurations for Logstash and Rsyslog containers.

**Explanation**: This file orchestrates the deployment of multiple Docker containers, ensuring they are correctly configured and connected.

#### Dockerfile

- **[rsyslog/Dockerfile](task2/rsyslog/Dockerfile)**: Defines the steps to build a Docker image for Rsyslog.

**Explanation**: This file contains the instructions to build a Docker image for Rsyslog, including installing necessary packages and copying configuration files.

### Configuration Files

- **[rsyslog/log.conf](task2/rsyslog/log.conf)**: Configuration file for Rsyslog.

**Explanation**: This file contains the configuration settings for Rsyslog, defining how logs are processed and where they are stored.

### Systemd Service

- **[log_sender.service](task2/log_sender.service)**: Systemd service file for log sender.

**Explanation**: This file defines a systemd service for the log sender script, ensuring it runs as a background service.

### Shell Script

- **[log_sender.sh](task2/log_sender.sh)**: Shell script for log sender.

**Explanation**: This script is responsible for sending logs to a specified destination. It is executed by the systemd service.

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

## Note

To use the ftp server on /var/log:
```sh
lftp ftp://rsyslog:StrongPassword1@ip
```
### Data Life Cycle:
    Hot Phase
    Indices are kept in the hot phase for up to 7 days or until they reach 50GB in size.
    Once these conditions are met, the index rolls over to a new index, allowing new data to continue being stored efficiently.
    Warm Phase
    After 7 days, the index transitions to the warm phase.
    In this phase, the index undergoes a forcemerge to reduce the number of segments to 1. This helps reduce disk space usage and optimizes the index for read operations.
    Delete Phase
    After 180 days, the index enters the delete phase.
    In this phase, the index is deleted to free up storage space, ensuring efficient use of system resources.