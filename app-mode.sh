#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title App Mode
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🤖
# @raycast.argument1 { "type": "dropdown", "placeholder": "Choose Mode", "data": [ { "title": "Home", "value": "home" }, { "title": "Work", "value": "work" }, { "title": "Podcasting", "value": "podcasting" } ] }

# Documentation:
# @raycast.description Open Apps
# @raycast.author Robb Knight
# @raycast.authorURL https://rknight.me

# Quit all apps
open raycast://extensions/raycast/system/quit-all-applications

CORE=(Discord Safari Mail Music Slack Raindrop Ivory iTerm Obsidian)

TYPE=$1

open_core_apps () {
    for value in "${CORE[@]}"
    do
        open -a "$value"
    done
}

if [ "$TYPE" = 'home' ]; then
    open_core_apps
	exit
fi

if [ "$TYPE" = 'work' ]; then
    open_core_apps
    open -a PhpStorm
    open -a Gitify
    open -a "Google Chrome" https://github.com/notifications?query=is%3Aunread
    osascript -e "set volume with output muted"
	exit
fi

if [ "$TYPE" = 'podcasting' ]; then
    open -a Ivory
    open -a Zoom
    open -a "Audio Hijack Pro"
    open -a Notes x-coredata://89A52B7C-2866-471A-A244-2F0F807EA32B/ICNote/p137
    open -a "Sublime Text" /Users/robb/Library/Mobile\ Documents/com~apple~CloudDocs/knightdrive/20-29\ Podcasts/20\ Ruminate/20.04\ Shownotes/shownotes.md
	/opt/homebrew/bin/SwitchAudioSource -s "DELL U2419H"
	/opt/homebrew/bin/SwitchAudioSource -s "Razer Seiren Mini" -t "input"
	exit
fi