#!/bin/bash
set -e
set -x
DIR="$(cd "$(dirname "$0")" && pwd)"

if command -v python3 ; then
    python3 "$DIR/config_linux.py"
elif command -v python ; then
    python "$DIR/config_linux.py"
else #init termux
    apt install python
    python "$DIR/config_linux.py"
fi