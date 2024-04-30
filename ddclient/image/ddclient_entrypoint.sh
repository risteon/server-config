#!/bin/bash

# config starts a daemon that checks and updates periodically
/usr/bin/ddclient -file /config/ddclient.conf

# wait forever
trap : TERM INT; sleep infinity & wait

