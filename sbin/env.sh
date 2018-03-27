#!/bin/bash
# ¼Óµ½ ~/.bash_profile


export GOROOT=/usr/local/go
export GOPATH=$HOME/vwork
export GOBIN=$HOME/vwork/bin
export GOSBIN=$HOME/vwork/sbin
export PMWEB=github.com
export PMMAIN=yuleihua
export PMNAME=airmq
export PATH=$PATH:/usr/local/go/bin:/usr/local/bin:$GOBIN:$GOSBIN:.

cd $GOPATH
source $GOSBIN/pm.sh

