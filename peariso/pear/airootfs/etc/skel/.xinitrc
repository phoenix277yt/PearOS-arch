#!/bin/bash
export DESKTOP_SESSION=plasma
# this shit makes tkinter work
xrdb -load /dev/null
xrdb -query
exec startplasma-x11