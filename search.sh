#!/bin/bash


url="https://www.bing.com/search?q="


query=$(echo "$@" | sed "s/ /+/g")


full_url="$url$query"


echo "Searching: $full_url"

curl -s -L -A Lynx "$full_url" |\

tr '<' '\n' |
tr -d '\n' |
sed 's/" /\n/g' |\
grep -oP '(?<=href=")(http[s]?://[^"]+)' |\
grep -v "bing.com\|microsoft.com\|live.com\|creativecommons.org" |\
sort | uniq
