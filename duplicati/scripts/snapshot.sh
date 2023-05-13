#!/bin/bash
set -eu

function create_snapshot {
  local arg1_src_name="$1"
  # default: same name in destination
  local arg2_dest_name="${2:-$arg1_src_name}"

  # use a lockfile to guard access to the pipe (in/out)
  lockfile="/pipe/pipe.lockfile"
  exec 3>$lockfile
  flock -x 3

  # create snapshot and exit from this function with the desired return value
  echo "create $arg1_src_name $arg2_dest_name" > /pipe/btrfs_pipe_in
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

