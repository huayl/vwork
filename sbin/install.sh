#!/bin/bash

source $GOPATH/env.sh

pmhome base
git pull
make install

ezhome lib
git pull
make install
