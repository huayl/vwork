#!/bin/bash

source $GOSBIN/env.sh

function _install() {
	go get -u $1
	go install -v $1
}

#_install google.golang.org/grpc
_install github.com/golang/protobuf/proto
_install github.com/golang/protobuf/protoc-gen-go
#_install github.com/spf13/cobra/cobra
#_install github.com/hashicorp/consul
#_install github.com/hashicorp/consul-template
_install github.com/nsf/gocode
_install github.com/rogpeppe/godef
#_install golang.org/x/tools/cmd/goimports

