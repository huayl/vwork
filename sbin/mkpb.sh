#!/bin/bash -e

line=$1


if [[ "$(basename $(pwd))" != "pkgapi" ]]; then
	echo "please run name as pkgapi directory" >&2
	exit
fi

mkdir -p ./pkg/${line}
cd api/proto
protoc ./${line}/*.proto --go_out=plugins=grpc:./pkg/${line}

@echo "${line} done\n"