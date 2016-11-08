#!/bin/bash

NC='\033[0m'
RED='\033[31m'
GREEN='\033[32m'
BLUE='\033[34m'
YELLOW='\033[33m'

# Displays nice colorful header
function header {
	echo
	echo "=========================================================================="
	echo -e "${YELLOW} $1 ${NC}"
	echo "--------------------------------------------------------------------------"
}

# Checks if application is accessible through PATH, and accumilates missing applications count in $MISSING_TOOLS variable.
MISSING_TOOLS=0
function require {
	exe=$1
	description=$2
	reqiredVersions=$3
	errorMessage=$4
	
	which $exe &> /dev/null
	if [ $? -eq 0 ]; then
		if [ -z "$reqiredVersions" ]; then
			if [ ! -z $description ]; then
				echo -e "${GREEN}$description was found.${NC}"
			fi
		fi
	else
		let MISSING_TOOLS=$MISSING_TOOLS+1
		echo -e "${RED}${description:-$exe} was not found. Install it and add to PATH.${NC}"
		if [ -n "$errorMessage" ]; then
			echo -e "${RED}$errorMessage${NC}"
		fi
		return 1
	fi
	
	if [ -n "$reqiredVersions" ]; then
	    OIFS=$IFS
	    IFS=', ' read -a versions <<< "$reqiredVersions"
		IFS=$OIFS
		for reqiredVersion in "${versions[@]}"
		do
			$exe --version | grep -q $reqiredVersion
			if [ $? -eq 0 ]; then foundVersion=$reqiredVersion; fi
		done
		if [ ! -z $foundVersion ]; then
			if [ ! -z $description ]; then
				echo -e "${GREEN}$description $foundVersion was found.${NC}"
			fi
		else
			let MISSING_TOOLS=$MISSING_TOOLS+1
			echo -e "${RED}$description found, but doesn't match reqired version $reqiredVersions \nYou have:${NC}"
			$exe --version
			if [ -n "$errorMessage" ]; then
				echo -e "${RED}$errorMessage${NC}"
			fi
			return 1
		fi
	fi
	return 0
}

# function vercomp() { test "$(echo "$@" | tr " " "\n" | sort -V | tail -n 1)" == "$1"; }
