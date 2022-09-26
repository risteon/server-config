# Notes

Map container port 68 (DHCP) to host 10068 (unused).
Disable resolve listener on Ubuntu: https://www.qualityology.com/tech/ubuntu-port-53-already-in-use-how-to-free-the-dns-port/

Edit `/etc/systemd/resolved.conf`:
```
[Resolve]
DNS=localhost   # OR local gateway
#FallbackDNS=
#Domains=
#LLMNR=no
#MulticastDNS=no
#DNSSEC=no
#DNSOverTLS=no
#Cache=no-negative
DNSStubListener=no 
#ReadEtcHosts=yes
```

and `sudo ln -sf /run/systemd/resolve/resolv.conf /etc/resolv.conf`

`sudo systemctl restart systemd-resolved.service`
