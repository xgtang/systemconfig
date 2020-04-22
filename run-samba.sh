#!/bin/bash

docker  stop $(docker ps -a -q) && docker  rm -f $(docker ps -a -q)

docker run -d --name samba -it -p 139:139 -p 445:445 -d \
            -v /opt/data/share:/mnt/data \
            dperson/samba -p \
            -u "hl;hl1234" \
            -s "data;/mnt/data;yes;no;no;all;none"

