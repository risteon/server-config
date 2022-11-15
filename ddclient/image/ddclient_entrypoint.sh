#!/bin/bash
cp /config/ddclient.conf /etc/ddclient.conf

while true; do
  /usr/sbin/ddclient -verbose
  # if update did not return 0, exit with status code 1
  if [ $? -ne 0 ]; then
    echo 'errored out, exiting'
    exit 1
  fi
  sleep 1800
done
