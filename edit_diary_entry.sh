#!/bin/bash

# Setup
ENTRYFILE=$1
if [ -z ${ENTRYFILE} ]; then
	echo "I need to know which entry you want to edit."
	exit 1;
fi

# Edit
"${EDITOR:-vi}" $ENTRYFILE 

# Add to git repository
git add $ENTRYFILE
git commit -m "Updated entry: ${ENTRYFILE}."

