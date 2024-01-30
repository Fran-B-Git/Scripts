#!/bin/sh -e

ls .sbsync > /dev/null

a=$(grep "SBSYNC_REMOTE_ROOT=" .sbsync/config | sed "s/^.*fba\///")

ssh -t hn49 "$a; bash --login"
