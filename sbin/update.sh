#!/bin/bash

source $GOPATH/sbin/env.sh

function _update()
{
	appfile=$GOPATH/config/pkg.ini
	while read line
	do
		remark=`echo ${line}	| grep "^\s*#"`
		if [ "${remark}" != "" ];then
			continue
		fi
		echo "update packages in ${line}"
		go get -u ${line}
	done < ${appfile}
}

_update $@
