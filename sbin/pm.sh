#!/bin/bash

source $GOSBIN/completion.sh

__doc__() {
	echo -n
}

pmenv() {
	__doc__ 设置环境变量

	export PM_INIT=1
}

_setpro() {
	if [[ "$1" != "../" ]]; then
		export PMNAME=$1
	fi
}

_mainpath() {
	local target=$GOPATH
	if [[ "$1" != "" ]]; then
		target=$GOPATH/src/$PMWEB/$PMMAIN/$1
		_setpro $1
	else
		target=$GOPATH
		_setpro $PMMAIN
	fi
	if [[ "$1" == "../" ]]; then
		target=$pwd/../
	fi
	echo $target
}

pmh() {
	__doc__ 跳回到主目录或某个项目
	pmenv
	cd $(_mainpath $@)
}

_pmh() {
	_file_completion $GOPATH
}

complete -F _pmh -o filenames pmh

# 如果当前目录在GOPATH目录下,自动更新环境变量
if [[ "$pwd" == "$GOPATH" ]]; then
	pmenv
fi

