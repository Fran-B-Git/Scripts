#!/bin/sh
nmcli -f GENERAL.STATE c show devnet | grep -q "activated"

if [ $? -ne 0 ]
then
    nmcli c up devnet
fi
devbox shell