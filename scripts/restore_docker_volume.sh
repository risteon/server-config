#!/bin/bash
set -eux

# usage: ./restore_docker_volume.sh VOLUME_NAME PATH_TO_TAR_FILE

DIR="$(dirname "${2}")" ; FILE="$(basename "${2}")"

cd $DIR

docker run --rm \
  -v "$1":/backup-volume \
  -v "$(pwd)":/backup:ro \
  busybox \
  tar --directory /backup-volume -xf "/backup/$FILE"
