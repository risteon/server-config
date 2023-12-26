docker run --rm \
  -v "$1":/backup-volume \
  -v "$(pwd)":/backup:ro \
  busybox \
  tar --directory /backup-volume -xvf "/backup/backup_$1.tar.gz"
