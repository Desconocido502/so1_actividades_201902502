#!/bin/bash

# Compila el código fuente
g++ -o main main.c

# Verifica si la compilación fue exitosa
if [ $? -eq 0 ]; then
    echo "Compilación exitosa. Ejecutando programa..."
    ./main
else
    echo "Error durante la compilación."
fi
