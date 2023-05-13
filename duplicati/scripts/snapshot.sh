#!/bin/bash
set -eu

function create_snapshot {
  # use a lockfile to guard access to the pipe (in/out)
  lockfile="/pipe/pipe.lockfile"
  exec 3>$lockfile
  flock -x 3

  # create snapshot and exit from this function with the desired return value
  echo "create $1" > /pipe/btrfs_pipe_in
  retval=$(cat /pipe/btrfs_pipe_out)
  exit $retval
}


function delete_snapshot {
  # use a lockfile to guard access to the pipe (in/out)
  lockfile="/pipe/pipe.lockfile"
  exec 3>$lockfile
  flock -x 3

  echo "delete $1" > /pipe/btrfs_pipe_in
  retval=$(cat /pipe/btrfs_pipe_out)
  exit $retval
}

