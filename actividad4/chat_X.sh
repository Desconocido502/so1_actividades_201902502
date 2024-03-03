#!/bin/bash

PIPE_X_Y="/tmp/chat_pipe_X_Y"

# Crear el pipe en caso de que no existe
[ -p "$PIPE_X_Y" ] || mkfifo "$PIPE_X_Y"

exec 3<> "$PIPE_X_Y"

echo "Chat X iniciado"

while true; do
    read -r message
    echo "X: $message" > "$PIPE_X_Y"
    sync    # Esperar a que el mensaje sea leído
    read -r response < "$PIPE_X_Y"
    echo "Y: $response"
done

exec 3>&-