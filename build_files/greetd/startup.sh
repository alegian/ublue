#!/bin/bash

sway --unsupported-gpu --config /etc/greetd/sway-config &
pid=$!

while ! sock="$(sway --get-socketpath 2>/dev/null)"; do
    sleep 0.05
done

SWAYSOCK="$sock" swaymsg exec 'sh -c "gtkgreet -l -s /etc/greetd/style.css; swaymsg exit"'
wait "$pid"
