#!/bin/bash

NOW=$(date +%c)
SETTINGFILE=".diary"
AUTHORLINE=1
INSTITUTELINE=2

# Read diary's metadata
AUTHOR=$(sed "${AUTHORLINE}q;d" $SETTINGFILE | sed -e "s/ /-/")
INSTITUTE=$(sed "${INSTITUTELINE}q;d" $SETTINGFILE | sed -e "s/ /-/")


# Write note
ENTRYFILE="${AUTHOR}_$(date +%Y%m%d_%H%M%S).txt"
"${EDITOR:-vi}" $ENTRYFILE 

# Add to git repository
git add $ENTRYFILE
git commit -m "New entry: ${ENTRYFILE}."

