#!/bin/bash
scrot /tmp/screenshot.png
convert /tmp/screenshot.png -blur 0x5 /tmp/screenblur.png
i3lock -i /tmp/screenblur.png
