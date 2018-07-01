#!/bin/bash


function pmenv() 
{
	export PM_INIT=1
}

function _setpro() 
{
	if [[ "$1" != "../" ]]; then
		export PMNAME=$1
	fi
}

function _file_completion() 
{
	local cur
	COMPREPLY=()
	cur=${COMP_WORDS[COMP_CWORD]}
	case "$cur" in
		*)
		local files
		if [ "x$cur" = "x" ]; then
			files=$(ls $1/$cur)
		else 
			files=$(ls $(dirname $1/$cur))
		fi
		COMPREPLY=( $( compgen -W "$files" -- $cur ) );;
	esac
}

function _mainpath() 
{
	local target=$GOPATH
	local cutpath=`echo $1 | cut -b 1-6`
	
if [ "x$KAFKA_LOG4J_OPTS" = "x" ]; then
    export KAFKA_LOG4J_OPTS="-Dlog4j.configuration=file:$base_dir/../config/log4j.properties"
fi

if [ "x$KAFKA_HEAP_OPTS" = "x" ]; then
    export KAFKA_HEAP_OPTS="-Xmx1G -Xms1G"
fi



	if [[ "$cutpath" = "gitlab"  || "$cutpath" = "github" ]]; then
		target=$GOPATH/src/$cutpath.com/$2
	elif [ "$cutpath" = "root" ]; then
		target=$GOPATH/src/$PMWEB/$2
		_setpro $1
	elif [ "x$cutpath" != "x" ]; then
		target=$GOPATH/src/$PMWEB/$PMMAIN/$1
		_setpro $1
	else
		target=$GOPATH
		_setpro $PMMAIN
	fi
	
	echo $target
}

function pmh() 
{
	pmenv
	cd $(_mainpath $@)
}

function _pmh() 
{
	_file_completion $GOPATH
}

complete -F _pmh -o filenames pmh

#set env
if [ "$pwd"x = "$GOPATH"x ]; then
	pmenv
fi

