#!/bin/bash
# ¼Óµ½ ~/.bash_profile

export PATH=$PATH:/usr/local/go/bin:/usr/local/bin:.
export GOROOT=/usr/local/go
export GOPATH=$HOME/vwork
export GOBIN=$HOME/vwork/bin
export GOSBIN=$HOME/vwork/sbin
export PMMAIN=huayl
export PMNAME=test

cd $GOPATH
source $GOSBIN/pm.sh

