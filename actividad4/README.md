## Chat básico con Named Pipes y bash en Linux.

```markdown
# Bash Chat usando Named Pipes

Este proyecto implementa un simple chat en bash para dos participantes utilizando Named Pipes en Linux. Los Named Pipes, o pipes nombrados, proporcionan una forma de comunicación entre procesos y son utilizados en este chat para permitir que dos scripts de bash se comuniquen entre sí.

## Estructura del Proyecto

- **chat_X.sh**: Script para el participante X en el chat.
- **chat_Y.sh**: Script para el participante Y en el chat.

## Instrucciones de Uso

### Paso 1: Ejecutar chat_X.sh
```bash
./chat_X.sh
```
Esto iniciará el Chat X y esperará a que el usuario introduzca mensajes.

### Paso 2: Ejecutar chat_Y.sh en otra terminal
```bash
./chat_Y.sh
```
Esto iniciará el Chat Y y comenzará a recibir los mensajes de X.

## Funcionamiento Interno

### Creación de Named Pipe
- Al inicio de cada script, se define una variable `PIPE_X_Y` que representa la ruta al Named Pipe utilizado para la comunicación.

### Inicialización del Named Pipe
- Se verifica si el Named Pipe existe. Si no existe, se crea mediante el comando `mkfifo`.

### Comunicación Bidireccional
- Ambos scripts abren el Named Pipe en modo lectura y escritura (`exec 3<> "$PIPE_X_Y"`), lo que les permite enviar y recibir mensajes.

### Chat X
- El script de X lee mensajes del usuario, los envía al Named Pipe y espera a que el participante Y responda.
- Después de enviar un mensaje, se utiliza `sync` para esperar a que el mensaje sea leído por el participante Y.

### Chat Y
- El script de Y está continuamente leyendo mensajes del Named Pipe y respondiendo después de recibir un mensaje.
- Después de leer un mensaje, el participante Y espera a que el participante X responda antes de continuar.

### Finalización del Chat
- Se utiliza `exec 3>&-` para cerrar la conexión con el Named Pipe al final de la ejecución de cada script.

## Conversación de Ejemplo

En la terminal del Chat X:
```plaintext
Chat X iniciado
Good morning
Y: Hello, How are you?
I'm fine and you?
Y: Very Good!
bye
Y: see you later
```

En la terminal del Chat Y:
```plaintext
Chat B iniciado
X: Good morning
Y: Hello, How are you?
X: I'm fine and you?
Y: Very Good!
X: Bye
Y: see you later
```

## Notas Adicionales

- Asegúrate de tener permisos de ejecución en los scripts (`chmod +x chat_X.sh chat_Y.sh`) antes de ejecutarlos.
- Puedes personalizar los mensajes y la lógica según tus necesidades.

¡Diviértete explorando el funcionamiento del chat! Siéntete libre de ajustar y mejorar según tus requisitos.
```

Este README proporciona una explicación detallada de la estructura del proyecto, las instrucciones de uso y el funcionamiento interno del chat implementado con Named Pipes en bash. Puedes personalizarlo según tus necesidades específicas.