#!/bin/bash

function gen_ssh_proxy_files {
    cat <<"EOF" >$SSH_PROXY_FILE
Host *
    ProxyCommand nc -X 5 -x $SOCKS_PROXY %h %p
EOF
}

    export SOCKS_PROXY="127.0.0.1:7891"
    export http_proxy="http://127.0.0.1:7890"
    export https_proxy="http://127.0.0.1:7890"
    export SSH_PROXY_FILE="${HOME}/.ssh/config"

    gen_ssh_proxy_files
    function finish {
       rm -f $SSH_PROXY_FILE
    }
    trap finish EXIT

$@
