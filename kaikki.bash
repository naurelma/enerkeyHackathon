#! /bin/bash

if [[ ! -n "$1" ]] ; then
	echo "Usage: $0 targetDir"
	exit
fi
SCRIPTIT=$PWD
export SCRIPTIT

cd "$1"
unzip OneDrive*
7z x Consumption_data.7z -o"Consumption_data" -aos
7z x Temperature.7z -o"Temperature" -aos

$SCRIPTIT/siivoa.bash
$SCRIPTIT/jaaxlsx.bash
$SCRIPTIT/haetmp.bash