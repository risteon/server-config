docker run --rm \
  -v "$1":/backup-volume:ro \
  -v "$(pwd)":/backup \
  busybox \
  tar -zcvf "/backup/backup_$1.tar.gz" --directory=/backup-volume .
