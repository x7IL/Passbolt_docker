```
██╗   ██╗██╗██████╗ ████████╗██╗   ██╗ ██████╗ ██╗    ██╗ ██████╗ ██████╗ ██╗  ██╗███████╗    ██╗   ██╗ █████╗ ██╗   ██╗██╗     ████████╗
██║   ██║██║██╔══██╗╚══██╔══╝██║   ██║██╔═══██╗██║    ██║██╔═══██╗██╔══██╗██║ ██╔╝██╔════╝    ██║   ██║██╔══██╗██║   ██║██║     ╚══██╔══╝
██║   ██║██║██████╔╝   ██║   ██║   ██║██║   ██║██║ █╗ ██║██║   ██║██████╔╝█████╔╝ ███████╗    ██║   ██║███████║██║   ██║██║        ██║
╚██╗ ██╔╝██║██╔══██╗   ██║   ██║   ██║██║   ██║██║███╗██║██║   ██║██╔══██╗██╔═██╗ ╚════██║    ╚██╗ ██╔╝██╔══██║██║   ██║██║        ██║
 ╚████╔╝ ██║██║  ██║   ██║   ╚██████╔╝╚██████╔╝╚███╔███╔╝╚██████╔╝██║  ██║██║  ██╗███████║     ╚████╔╝ ██║  ██║╚██████╔╝███████╗   ██║
  ╚═══╝  ╚═╝╚═╝  ╚═╝   ╚═╝    ╚═════╝  ╚═════╝  ╚══╝╚══╝  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝      ╚═══╝  ╚═╝  ╚═╝ ╚═════╝ ╚══════╝   ╚═╝
```

# Passbolt avec docker (Linux) et son utilisation

# Sommaire

## 2. Installation local (avec scripts)

- [Pré-requis](#pre-requis-script) _Installation de docker_
- [Build l'image](#build-image-script) _Build les images docker_
- [Run l'image](#run-image-script) _Run les images docker_
- [Créer un utilisateur](#create-user) _Création d'un utilisateur_

---

```
██╗      ██████╗  ██████╗ █████╗ ██╗            ██╗       ███████╗ ██████╗██████╗ ██╗██████╗ ████████╗
██║     ██╔═══██╗██╔════╝██╔══██╗██║            ██║       ██╔════╝██╔════╝██╔══██╗██║██╔══██╗╚══██╔══╝
██║     ██║   ██║██║     ███████║██║         ████████╗    ███████╗██║     ██████╔╝██║██████╔╝   ██║   
██║     ██║   ██║██║     ██╔══██║██║         ██╔═██╔═╝    ╚════██║██║     ██╔══██╗██║██╔═══╝    ██║   
███████╗╚██████╔╝╚██████╗██║  ██║███████╗    ██████║      ███████║╚██████╗██║  ██║██║██║        ██║   
╚══════╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝╚══════╝    ╚═════╝      ╚══════╝ ╚═════╝╚═╝  ╚═╝╚═╝╚═╝        ╚═╝                                                                                                         
```
_Installation local avec script_
## Pre-requis script

> Installer [docker](https://docs.docker.com/engine/install/)

_Pour docker:_

- Distro [Debian](https://docs.docker.com/engine/install/debian/)
- Distro [Ubuntu](https://docs.docker.com/engine/install/ubuntu/)
- Autres [Overview](https://docs.docker.com/engine/install/)
- 
## Build image script

_Mettez-vous dans le répertoire du script /script_local/build_dev_local.sh_

---
_Pour build les images executer cette commande_

```
./build_dev_local.sh
```

## Run image script

_Mettez-vous dans le répertoire du script /script_local/run_dev_local.sh_

---
_Pour run le conteneur executer cette commande_

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

_Il faut un web user sur la machine qui va lancer la commande de création d'utilisateurs_

_Executez cette commande pour la création d'un utiisateur:_
```
docker exec -it vault.virtuoworks.local su -s /bin/bash -c "./bin/cake passbolt register_user -i" www-data
```
