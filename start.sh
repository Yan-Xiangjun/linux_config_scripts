#!/bin/bash
if command -v python3 ; then
    python3 ./config_linux.py
elif command -v python ; then
    python ./config_linux.py
else #init termux
    apt install python
    python ./config_linux.py
fi