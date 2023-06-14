#!/usr/bin/env bash

# Si quieres depurar cambia a DEBUG=1
DEBUG=0

# Termina todas las instacias de polybar
killall -q polybar
# Si las barras tienen `ipc` habilitado lo puedes utilizar con
# polybar-msg cmd quit

# Inicia las barras de estado `bar1` y `bar2`
if [ $DEBUG -eq 1 ]
then
    echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
    polybar new 2>&1 | tee -a /tmp/polybar1.log & disown
#   polybar derecha 2>&1 | tee -a /tmp/polybar2.log & disown
#   polybar centro 2>&1 | tee -a /tmp/polybar3.log & disown

else
    polybar new >/dev/null 2>&1 & disown
 #  polybar derecha >/dev/null 2>&1 & disown
 #  polybar centro >/dev/null 2>&1 & disown
fi
echo "Barras de estado iniciadas..."
