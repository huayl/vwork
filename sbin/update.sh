#!/bin/bash

source $GOPATH/env.sh

function _update()
{
	appfile=$GOPATH/config/app.ini
	while read line
	do
		remark=`echo ${line}	| grep "^\s*#"`
		if [ "${remark}" != "" ];then
			continue
		fi
		echo "govendor update packages in ${line}"
		pmh ${line}
		govendor fetch -v +vendor
	done < ${appfile}
}

_update $@
