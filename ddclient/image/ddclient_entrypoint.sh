#!/bin/bash
cp /config/ddclient.conf /etc/ddclient.conf

# config starts a daemon that checks and updates periodically
/usr/bin/ddclient

# wait forever
trap : TERM INT; sleep infinity & wait

