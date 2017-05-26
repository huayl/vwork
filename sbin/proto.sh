#!/bin/bash -e

source $GOPATH/sbin/env.sh

if [[ "$(basename $(pwd))" != "gen" ]]; then
	echo "please run name as gen directory" >&2
	exit 1
fi

function _makepb()
{
	proname=$1
	
	cat	> pb_${proname}	<< EOF 
gen_proto: rpc/${proname}/*.pb.go
clean_proto:
	rm -f rpc/${proname}/*.pb.go
rpc/${proname}/*.pb.go: apidoc/proto/${proname}/*.proto $(shell which protoc) $(shell which protoc-gen-go)
	@mkdir -p rpc
	@echo "gen proto"
	@rm -f rpc/${proname}/*.pb.go
	@protoc -I apidoc/proto api/proto/${proname}/*.proto --go_out=dep_path=${PMWEB}/${PMMAIN}/${proname}/pkg/${proname},plugins=grpc:rpc

	EOF
}

_makepb $@
