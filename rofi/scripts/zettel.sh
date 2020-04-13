#!/bin/sh
set -u
set -e

readonly WIKI_DIR=~/wiki

if [[ ! -a "${WIKI_DIR}" ]]; then
	echo "empty" >> "${WIKI_DIR}"
fi

function get_notes()
{
	cd ${WIKI_DIR}
	rg -l -tmd ""
}

function main()
{
	local all_notes="$(get_notes)"
	local note=$( (echo "${all_notes}")| rofi -dmenu -theme themes/zettelmenu.rasi -p "Note")
	if [[ -n "${note}" ]]; then
		local matching=$( (echo "${all_notes}") | rg -l "^${note}$")
		if [[ -n "${matching}" ]]; then
			tmux new-window -n "zettel"
			tmux send-keys "nvim ${WIKI_DIR}/${note}" C-m
		else
			local now="$(date +'%Y-%m-%d-%H%M')"
			local filename="${WIKI_DIR}/${now}-${note}.md"
			tmux new-window -n "zettel"
			tmux send-keys "nvim ${filename}" C-m
		fi
	fi
}

main
