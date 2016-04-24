#!/bin/bash

# This script initializes a git repository with a $SETUPFILE file containing authors name, institute and creation date.

SETUPFILE=".diary"

# Create .diary

if [ -f $SETUPFILE ]; then
	echo "There is another diary stored in this folder. Do you really want to OVERWRITE it? Yes/No: "
	read answer

	if [[ ! $answer =~ ^[Yy]$ ]]; then
		exit 1
	fi
fi

echo "Type the author's name, following by [ENTER]: "

read author

echo "Type the institute where the author belongs, following by [ENTER]: "

read institute

NOW=$(date +%c)

touch $SETUPFILE
echo -e "$author\n$institute\n\n$NOW">> $SETUPFILE

# Create a git repository

git init

# Add .diary to the repository

git add .diary
git commit -m "Creation of a diary."

