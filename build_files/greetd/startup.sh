#!/bin/bash

sway --unsupported-gpu --config /etc/greetd/sway-config &
while ! swaymsg -t get_version >/dev/null 2>&1; do
    sleep 0.05
done

swaymsg exec "gtkgreet -l -s /etc/greetd/style.css; swaymsg exit"
wait
