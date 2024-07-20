#!/bin/sh

# This script is used to convert gitmojis.json to gitmojis.lua

gitmojis="./lua/gitmoji/gitmojis.lua";

echo "return { $(curl -s https://raw.githubusercontent.com/carloscuesta/gitmoji/master/packages/gitmojis/src/gitmojis.json \
| jq .gitmojis \
| sed -E 's/\"([^\"]+)\" *: */\1 = /g' \
| sed 's/null/nil/' \
| sed 's/^\[//' \
| sed 's/\]$//') }" > $gitmojis
