```
███╗   ███╗██╗   ██╗    ██╗   ██╗ █████╗ ██╗   ██╗██╗  ████████╗
████╗ ████║╚██╗ ██╔╝    ██║   ██║██╔══██╗██║   ██║██║  ╚══██╔══╝
██╔████╔██║ ╚████╔╝     ██║   ██║███████║██║   ██║██║     ██║   
██║╚██╔╝██║  ╚██╔╝      ╚██╗ ██╔╝██╔══██║██║   ██║██║     ██║   
██║ ╚═╝ ██║   ██║        ╚████╔╝ ██║  ██║╚██████╔╝███████╗██║   
╚═╝     ╚═╝   ╚═╝         ╚═══╝  ╚═╝  ╚═╝ ╚═════╝ ╚══════╝╚═╝   
```

# Passbolt with docker (Linux) and its use

# Contents

## 1.. local installation (with scripts)

- [Pre-requisites](#pre-requisites-script) _Installing docker__ (Linux)
- [Build image](#build-image-script) _Build docker images_
- [Run the image](#run-image-script) _Run the docker images_
- [Create a user](#create-user) _Create a user_
---

```
███████╗ ██████╗██████╗ ██╗██████╗ ████████╗
██╔════╝██╔════╝██╔══██╗██║██╔══██╗╚══██╔══╝
███████╗██║     ██████╔╝██║██████╔╝   ██║   
╚════██║██║     ██╔══██╗██║██╔═══╝    ██║   
███████║╚██████╗██║  ██║██║██║        ██║   
╚══════╝ ╚═════╝╚═╝  ╚═╝╚═╝╚═╝        ╚═╝                                                                                                    
```
_Local installation with script_
## Pre requisites script

> Install [docker](https://docs.docker.com/engine/install/)

_For docker:_

- Distro [Debian](https://docs.docker.com/engine/install/debian/)
- Distro [Ubuntu](https://docs.docker.com/engine/install/ubuntu/)
- Others [Overview](https://docs.docker.com/engine/install/)

## Build image script

_Go to the script directory /script/local/build.sh_.

---
_To build the images run this command_.

```
./build.sh
```

## Run image script

_Go to the script directory /script/local/run_dev_local.sh_.

---
_To run the container, execute this command_.

```
./run_dev_local.sh
```
## Create user

### Web user

```
sudo useradd -r -s /bin/false www-data
sudo groupadd www-data
sudo usermod -a -G www-data www-data
```

_You need a web user on the machine that will run the user creation command_.


```
docker exec -it vault.virtuoworks.local su -s /bin/bash -c "./bin/cake passbolt register_user -i" www-data
```
_Run this command to create a user:_