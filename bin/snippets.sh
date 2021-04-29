#!/bin/sh

LIBRARY_SNIPPETS_DIR="${HOME}/Library/Developer/Xcode/UserData/CodeSnippets"
MY_SNIPPETS_DIR="./CodeSnippets"
COLLECTION_DIR=./Collected
NAME_PREFIX="\$amplify_"

function die() {
    echo "error: $@"
    exit 1
}

if [ ! -d "${LIBRARY_SNIPPETS_DIR}" ]; then
    die "directory not found: ${LIBRARY_SNIPPETS_DIR}"
fi

function collect()
{
    if [ -d "${COLLECTION_DIR}" ]; then
        die "directory already exists: ${COLLECTION_DIR}"
    fi

    mkdir -p "${COLLECTION_DIR}"

    echo "Collecting snippets"

    AMPLIFY_SNIPPETS=$(find "${LIBRARY_SNIPPETS_DIR}" -depth 1 -name \*.codesnippet -exec grep -li "${NAME_PREFIX}" {} \;)

    for AMPLIFY_SNIPPET in ${AMPLIFY_SNIPPETS}; do
        cp "${AMPLIFY_SNIPPET}" "${COLLECTION_DIR}"
        echo "collected $(basename "${AMPLIFY_SNIPPET}")"
    done

    echo "See collected files in ${COLLECTION_DIR}"
}

function clear()
{
    AMPLIFY_SNIPPETS=$(find "${LIBRARY_SNIPPETS_DIR}" -depth 1 -name \*.codesnippet -exec grep -li "${NAME_PREFIX}" {} \;)

    for AMPLIFY_SNIPPET in ${AMPLIFY_SNIPPETS}; do
        rm "${AMPLIFY_SNIPPET}"
        echo "cleared $(basename "${AMPLIFY_SNIPPET}")"
    done
}

function install()
{
    AMPLIFY_SNIPPETS=$(find "${MY_SNIPPETS_DIR}" -depth 1 -name amplify\*.codesnippet -exec grep -li amplify {} \;)

    for AMPLIFY_SNIPPET in ${AMPLIFY_SNIPPETS}; do
        cp "${AMPLIFY_SNIPPET}" "${LIBRARY_SNIPPETS_DIR}"
        echo "installed $(basename "${AMPLIFY_SNIPPET}")"
    done
}

function help()
{
    echo "$0 [ collect | clear | install ]"
}

 if [ -z $1 ]; then
   help
   exit 0
 fi
 
 while [ ! -z $1 ]; do
   case $1 in
   "collect") collect
     ;;
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