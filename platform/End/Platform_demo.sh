#!/bin/sh
echo -ne '\033c\033]0;Platform_demo\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/Platform_demo.x86_64" "$@"
