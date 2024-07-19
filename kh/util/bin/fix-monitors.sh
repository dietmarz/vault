#!/bin/bash
# Setze die Auflösungen der Monitore
xrandr --output DP-1-0.1.6 --mode 2560x1440 --rate 60
xrandr --output eDP-1 --mode 1920x1200 --rate 60

xrandr --output DP-1-0.2 --mode 1920x1080 --rate 60
sleep 2
xrandr --output DP-1-0.2 --mode 2560x1440 --rate 60

# Alternativ: Automatisch alle Monitore erneut erkennen und konfigurieren
xrandr --auto