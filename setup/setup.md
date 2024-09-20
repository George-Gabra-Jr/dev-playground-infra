# System Setup

## Basic Tooling and Packages Setup

### Update the System

```bash
sudo apt update
sudo apt upgrade
```

### Install Utility Packages

```bash
sudo apt install htop btop zip unzip tmux ranger
```

### Install micro (CLI Editor)

```bash
curl https://getmic.ro | bash
sudo mv micro /usr/bin
```

## Security Hardening

### Adjust the Hostname

```bash
sudo micro /etc/hostname ## Delete the old name and set up a new name.
sudo micro /etc/hosts ## Replace any occurrence of the existing computer name with your new one.
## You need to reboot for this to take effect.
```

### Setup Firewall

```bash
sudo ufw default allow outgoing
sudo ufw default deny incoming
sudo ufw allow ssh
sudo ufw allow http
sudo ufw allow https
sudo ufw enable
```

### Set Password for Users if Unset

```bash
sudo passwd root
sudo passwd <username>
```

### Ensure Only Root Has UID of 0

Accounts that have a UID set to 0 have the highest access to a system. In most cases, this should only be the "root" account. Use the following command to list all accounts with a UID of 0:

```bash
awk -F: '($3=="0"){print}' /etc/passwd
```

### Check for Accounts with Empty Passwords

Accounts that have no password essentially have no security. The command below will print all accounts that have an empty password:

```bash
sudo cat /etc/shadow | awk -F: '($2==""){print $1}'
```

### Harden SSH Security

Edit the `/etc/ssh/sshd_config` file.

```bash
sudo micro /etc/ssh/sshd_config
```

Add these rules:

```bash
PermitRootLogin no
PasswordAuthentication no
Port 22
AllowUsers <username>
PermitEmptyPasswords no
```

Restart the SSH service:

```bash
service ssh restart
```

### Enable App Armor

```bash
sudo systemctl start apparmor
sudo systemctl enable apparmor
```

### Install Fail2Ban to Protect from Brute Force Attacks

```bash
sudo apt install fail2ban
sudo systemctl enable fail2ban
sudo systemctl start fail2ban
sudo systemctl status fail2ban
```

### Check for Rootkits

The package "rkhunter" is useful for doing a quick scan of your system for any known rootkits:

```bash
sudo apt install rkhunter
sudo rkhunter --update
sudo rkhunter --checkall
```

### Check for Viruses

Install and use ClamAV to scan for viruses:

```bash
sudo apt install clamav clamav-daemon
sudo systemctl enable clamav-freshclam
```

## Make Swap to Increase System Performance

```bash
sudo dd if=/dev/zero of=/swapfile bs=512M count=32 ## 16 GB
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
sudo swapon -s
sudo micro /etc/fstab
## Add this line to fstab
## /swapfile none    swap    sw    0   0     
```

## Install Docker

### Clean Previous Docker Installations and Setup Apt Registries

```bash
sudo apt remove docker docker-engine docker.io containerd runc
sudo apt install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=\"$(dpkg --print-architecture)\" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo \"$VERSION_CODENAME\") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

### Install Docker Engine and CLI

```bash
sudo apt update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

### Docker Post-Install Configuration

Allow Docker to be used without admin privileges:

```bash
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
```

### Initialize Docker Swarm

```bash
docker swarm init
```

### Install Lazydocker (Docker CLI)

```bash
curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash
```

## Setup Networks

```bash
docker network create --driver overlay --attachable ingress-net
docker network create --driver overlay --attachable gateway
docker network create --driver overlay --attachable app
docker network create --driver overlay --attachable data
docker network create --driver overlay --attachable identity
docker network create --driver overlay --attachable messaging
docker network create --driver overlay --attachable observability
docker network create --driver overlay --attachable pipelines
```

## Setup Storage

### Setup network storage (EXPERIMENATAL)

```bash
sudo apt install s3fs

sudo mkdir -p /mnt/storage

echo ACCESS_KEY_ID:SECRET_ACCESS_KEY > /etc/passwd-s3fs
chmod 600 etc/passwd-s3fs

s3fs mybucket /mnt/storage -o passwd_file=/etc/passwd-s3fs -o url=https://url.to.s3/ -o allow_other

# add this to fstab
# mybucket /mnt/storage fuse.s3fs _netdev,allow_other,use_path_request_style,url=https://url.to.s3/ 0 0
```

### Identity

```bash
sudo mkdir -p /mnt/storage/keycloak_db
docker volume create --name keycloak_db --opt type=none --opt device=/mnt/storage/keycloak_db --opt o=bind
```

### Data

```bash
sudo mkdir -p /mnt/storage/data_db
docker volume create --name data_db --opt type=none --opt device=/mnt/storage/data_db --opt o=bind
```

### Observability

```bash
sudo mkdir -p /mnt/storage/netdataconfig
sudo mkdir -p /mnt/storage/netdatalib
sudo mkdir -p /mnt/storage/netdatacache
sudo mkdir -p /mnt/storage/grafana_data
sudo mkdir -p /mnt/storage/prometheus_data
sudo mkdir -p /mnt/storage/loki_data
sudo mkdir -p /mnt/storage/prometheus_data
docker volume create --name netdataconfig --opt type=none --opt device=/mnt/storage/netdataconfig --opt o=bind
docker volume create --name netdatalib --opt type=none --opt device=/mnt/storage/netdatalib --opt o=bind
docker volume create --name netdatacache --opt type=none --opt device=/mnt/storage/netdatacache --opt o=bind
docker volume create --name grafana_data --opt type=none --opt device=/mnt/storage/grafana_data --opt o=bind
docker volume create --name prometheus_data --opt type=none --opt device=/mnt/storage/prometheus_data --opt o=bind
docker volume create --name loki_data --opt type=none --opt device=/mnt/storage/loki_data --opt o=bind
docker volume create --name tempo_data --opt type=none --opt device=/mnt/storage/tempo_data --opt o=bind
```

### Pipelines

```bash
sudo mkdir -p /mnt/storage/registry_data
sudo mkdir -p /mnt/storage/jenkins_home
sudo mkdir -p /mnt/storage/portainer_data
sudo mkdir -p /mnt/storage/sonarqube_data
sudo mkdir -p /mnt/storage/sonarqube_db
docker volume create --name registry_data --opt type=none --opt device=/mnt/storage/registry_data --opt o=bind
docker volume create --name jenkins_home --opt type=none --opt device=/mnt/storage/jenkins_home --opt o=bind
docker volume create --name portainer_data --opt type=none --opt device=/mnt/storage/portainer_data --opt o=bind
docker volume create --name sonarqube_data --opt type=none --opt device=/mnt/storage/sonarqube_data --opt o=bind
docker volume create --name sonarqube_db --opt type=none --opt device=/mnt/storage/sonarqube_db --opt o=bind
```

### Allow Docker to pull from to Local Registry

```bash
sudo mkdir /etc/docker
sudo touch /etc/docker/daemon.json
sudo echo '{"insecure-registries" : ["http://localhost:5000"]}' > /etc/docker/daemon.json
## Restart Docker for this to take effect.
```

### Build Jenkins with Docker

```bash
cd pipelines
docker build -t jenkinswithdockercli:latest --file Dockerfile.jenkins .
```
