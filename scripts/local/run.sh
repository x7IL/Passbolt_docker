#!/bin/bash


# Current script directory
SCRIPT_DIR=$(dirname $(readlink -f $0))

# Passbolt configuration
PASSBOLT_IMAGE_NAME="local/vault"
PASSBOLT_LATEST="$PASSBOLT_IMAGE_NAME:latest"
PASSBOLT_CONTAINER_NAME="vault.local"

# MariaDB configuration
MARIADB_IMAGE_NAME="local/vault/db"
MARIADB_CONTAINER_NAME="db.vault.local"
MARIADB_LATEST="$MARIADB_IMAGE_NAME:latest"
MARIADB_DATA_PATH="${SCRIPT_DIR}/../../docker/mariadb/data"

# Environment file
ENV_FILE_PASSBOLT=${SCRIPT_DIR}/../../docker/passbolt/.env
ENV_FILE_DB=${SCRIPT_DIR}/../../docker/mariadb/.env


# Stopping any running containers
docker stop "$PASSBOLT_CONTAINER_NAME" 2> /dev/null;
docker stop "$MARIADB_CONTAINER_NAME" 2> /dev/null;

# Removing containers
docker rm "$PASSBOLT_CONTAINER_NAME" 2> /dev/null;
docker rm "$MARIADB_CONTAINER_NAME" 2> /dev/null;

# Volumes
APP_DIR=/var/lib/mysql
# Mounts
MOUNT_APP=source=$MARIADB_DATA_PATH,target=${APP_DIR}
# Network configuration
NETWORK_NAME="my_network"


# Running MariaDB container
docker run -d \
  --name "$MARIADB_CONTAINER_NAME" \
  --env-file ${ENV_FILE_DB} \
  --mount type=bind,${MOUNT_APP} \
  --network $NETWORK_NAME \
  -t "$MARIADB_IMAGE_NAME"

# Running Passbolt container
docker run -d \
  --name "$PASSBOLT_CONTAINER_NAME" \
  --link "$MARIADB_CONTAINER_NAME":$DATASOURCES_DEFAULT_HOST \
  -p 443:443 \
  --network $NETWORK_NAME \
  --env-file ${ENV_FILE_PASSBOLT} \
  -t "$PASSBOLT_LATEST"

# Créer un utilisateur
#docker exec -it vault.virtuoworks.local su -s /bin/bash -c "./bin/cake passbolt register_user -i" www-data