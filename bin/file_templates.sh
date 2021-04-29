#!/bin/sh

set -e

LIBRARY_FILE_TEMPLATES_DIR="${HOME}/Library/Developer/Xcode/Templates/File Templates/Amplify"
MY_FILE_TEMPLATES_DIR="./File Templates/Amplify"

function clear()
{
    if [ -d "${LIBRARY_FILE_TEMPLATES_DIR}" ]; then
        rm -rf "${LIBRARY_FILE_TEMPLATES_DIR}"
    fi
    echo "cleared Amplify file templates"
    echo "${LIBRARY_FILE_TEMPLATES_DIR}"
}

function install()
{
    mkdir -p "${LIBRARY_FILE_TEMPLATES_DIR}"
    cp -rp "${MY_FILE_TEMPLATES_DIR}"/*.xctemplate "${LIBRARY_FILE_TEMPLATES_DIR}"/
    echo "installed Amplify file templates"
    echo "${LIBRARY_FILE_TEMPLATES_DIR}"
    ls "${LIBRARY_FILE_TEMPLATES_DIR}"/*.xctemplate
}

function help()
{
    echo "$0 [ clear | install ]"
}

 if [ -z $1 ]; then
   help
   exit 0
 fi
 
 while [ ! -z $1 ]; do
   case $1 in
   "clear") clear
     ;;
   "install") install
     ;;
   "help") help
     ;;
     *) help
     ;;
   esac
   shift
 done