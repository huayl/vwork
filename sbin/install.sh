#!/bin/bash

source $GOPATH/env.sh

function _install()
{
	appfile=$GOPATH/config/app.ini
	while read line
	do
		remark=`echo ${line}	| grep "^\s*#"`
		if [ "${remark}" != "" ];then
			continue
		fi
		echo "make && make install ${line}"
		pmh ${line}
		make && make install
	done < ${appfile}
}

_install $@