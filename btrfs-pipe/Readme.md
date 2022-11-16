Run on host with user able to execute script without pw. btrfs is the pipe (`mkfifo btrfs_sub`).

```
while true; do eval "sudo ./btrfs_manage_snapshots $(cat ./btrfs_sub)"; done
```
