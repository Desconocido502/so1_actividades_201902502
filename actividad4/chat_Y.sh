#!/bin/bash

PIPE_X_Y="/tmp/chat_pipe_X_Y"

# Crear el named pipe si no existe
[ -p "$PIPE_X_Y" ] || mkfifo "$PIPE_X_Y"

exec 3<> "$PIPE_X_Y"

echo "Chat B iniciado"

while true; do
    read -r message < "$PIPE_X_Y"
    echo "X: $message"
    echo -n "Y: "  # Esperar entrada antes de responder
    read -r response
    echo "$response" > "$PIPE_X_Y"
    sync  #     Esperar a que el mensaje sea leído
done

exec 3>&-