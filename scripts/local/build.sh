#!/bin/bash

# Current script directory
SCRIPT_DIR=$(dirname $(readlink -f $0))

# Network configuration
NETWORK_NAME="my_network"

# Create network if not exists
docker network inspect $NETWORK_NAME >/dev/null 2>&1 || docker network create $NETWORK_NAME


# Image names
PASSBOLT_NAME="local/vault"
MARIADB_NAME="local/vault/db"

# Image tagging configuration
TAG=$(git log -1 --pretty=%h)
PASSBOLT_LATEST="$PASSBOLT_NAME:latest"
PASSBOLT_TAGGED="$PASSBOLT_NAME:$TAG"
MARIADB_LATEST="$MARIADB_NAME:latest"
MARIADB_TAGGED="$MARIADB_NAME:$TAG"

# Removing old passbolt image
docker image rm \
  "$PASSBOLT_LATEST" \
  "$PASSBOLT_TAGGED" 2> /dev/null

# Removing old mariadb image
docker image rm \
  "$MARIADB_LATEST" \
  "$MARIADB_TAGGED" 2> /dev/null

# Build passbolt
docker build \
  -t "$PASSBOLT_LATEST" \
  -t "$PASSBOLT_TAGGED" \
  ${SCRIPT_DIR}/../../docker/passbolt

# Build mariadb
docker build \
  -t "$MARIADB_LATEST" \
  -t "$MARIADB_TAGGED" \
  ${SCRIPT_DIR}/../../docker/mariadb

