#!/bin/bash -e

source $GOPATH/env.sh

if [[ "$(basename $(pwd))" != "pkgapi" ]]; then
	echo "please run name as pkgapi directory" >&2
	exit
fi

cd proto/
protoc -I . common/*.proto --go_out=plugins=grpc:$PM_PATH/pkg
