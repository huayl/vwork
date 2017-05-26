#!/bin/bash

source $GOSBIN/env.sh

function _update()
{
	pkgfile=$GOPATH/config/pkg.ini
	while read line
	do
		remark=`echo ${line}	| grep "^\s*#"`
		if [ "${remark}" != "" ];then
			continue
		fi
		go get -u $line
		go install -v $line
	done < ${pkgfile}
}

_update() $@

