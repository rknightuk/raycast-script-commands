#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title New file in Finder
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 📄
# @raycast.argument1 { "type": "text", "placeholder": "New file name" }

# Documentation:
# @raycast.description Create a file in the current Finder window
# @raycast.author Robb Knight
# @raycast.authorURL https://rknight.me

# count the open finder windows
COUNT="$(osascript -e 'tell application "Finder"' -e 'count of (every window where visible is true)' -e 'end tell')"

if [ "$COUNT" -eq "0" ]; then
	# If no windows open, default to downloads
	DIR="~/Downloads"
else
	# get the frontmost finder window
	DIR=$(osascript -e 'tell application "Finder"' -e 'set pathList to (POSIX path of (folder of the front window as alias))' -e 'end tell')
fi

NEW_FILE=$1
FILE_WITH_PATH="$DIR$NEW_FILE"

if test -f "$FILE_WITH_PATH"; then
    echo "$NEW_FILE aleady exists"
else
	touch "$FILE_WITH_PATH"
	echo "$NEW_FILE created in $DIR"
fi