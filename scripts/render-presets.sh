#!/usr/bin/env bash

set -e

find .dsh/ -name '*.tpl.yml' -exec bash -c '
set -e

target=$(echo {} | sed "s/.tpl//")

cat {} | envsubst > $target
echo "Rendered $target"
' \;
