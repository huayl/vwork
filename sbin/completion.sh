#!/bin/bash
_file_completion() {
	local cur
	COMPREPLY=()
	cur=${COMP_WORDS[COMP_CWORD]}
	
	case "$cur" in
		*)
		local files
		if [[ "$cur" == "" ]]; then
			files=$(ls $1/$cur)
		else 
			files=$(ls $(dirname $1/$cur))
		fi
		COMPREPLY=( $( compgen -W "$files" -- $cur ) );;
	esac
	
	return 0
}
