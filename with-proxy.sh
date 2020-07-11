#!/bin/bash

function gen_git_proxy_files {
    cat <<"EOF" >$GIT_PROXY_COMMAND
#!/bin/bash

if [ "x" != "x$SOCKS_PROXY" ]; then
    PROXY_OPT="-x $SOCKS_PROXY"
fi

exec nc -X 5 $PROXY_OPT $1 $2
EOF
    chmod +x $GIT_PROXY_COMMAND

    cat <<"EOF" >$GIT_SSH
#!/bin/bash

exec ssh -o ProxyCommand='git-proxy-git.sh %h %p' $@
EOF
    chmod +x $GIT_SSH
}

    export SOCKS_PROXY="127.0.0.1:1086"
    export http_proxy="http://127.0.0.1:1087"
    export https_proxy="http://127.0.0.1:1087"

    #export SOCKS_PROXY="`cat $HOME/.proxy`"
    #curl --data "socksParentProxy=$SOCKS_PROXY" http://localhost:8123/polipo/config

    tmpdir=$(dirname $(mktemp -u))
    export GIT_PROXY_COMMAND="$tmpdir/git-proxy-git.sh"
    export GIT_SSH="$tmpdir/git-proxy-ssh.sh"
    gen_git_proxy_files

    function finish {
        rm -f $GIT_PROXY_COMMAND
        rm -f $GIT_SSH
    }
    trap finish EXIT

$@
