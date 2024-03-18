# Hoja de Trabajo – CPU Scheduling

1. **Explique cuál es la diferencia entre Scheduling Permisivo y No Permisivo**

<p align="justify">La diferencia entre Scheduling Permisivo y No Permisivo radica en cómo se manejan las interrupciones durante el proceso de planificación de la CPU. En un sistema de Scheduling Permisivo, se permite que las interrupciones del temporizador interrumpan la ejecución de un proceso en cualquier momento, lo que puede resultar en cambios de contexto más frecuentes. Por otro lado, en un sistema de Scheduling No Permisivo, las interrupciones del temporizador solo se permiten al final de la ejecución de un proceso, lo que puede llevar a una menor frecuencia de cambios de contexto.
</p>

2. ¿Cuál de los siguientes algoritmos de Scheduling podría provocar un bloqueo indefinido? Explique su respuesta.

<ul>
  <li>a. First-come, first-served</li>
  <li>b. Shortest job first</li>
  <li>c. Round robin</li>
  <li>d. Priority</li>
</ul>

<p align="justify">El algoritmo de Scheduling que podría provocar un bloqueo indefinido es el algoritmo First-come, first-served. Este algoritmo puede causar bloqueo indefinido si un proceso con una duración muy larga se ejecuta primero y otros procesos más cortos quedan en espera detrás de él, lo que resulta en una espera prolongada para los procesos en cola.</p>

3. De estos dos tipos de programas:

<ul>
  <li>a. I/O-bound (un programa que tiene más I/Os que uso de CPU)</li>
  <li>b. CPU-bound (un programa que tiene más uso de CPU que I/Os)</li>
</ul>

<p align="justify">¿Cuál tiene más probabilidades de tener cambios de contexto voluntarios y cuál tiene más probabilidades de tener cambios de contexto no voluntarios? Explica tu respuesta.</p>

<p align="justify">En cuanto a los dos tipos de programas, un programa I/O-bound (con más operaciones de entrada/salida que uso de CPU) tiene más probabilidades de tener cambios de contexto voluntarios, ya que puede liberar la CPU voluntariamente mientras espera que se completen las operaciones de E/S. Por otro lado, un programa CPU-bound (con más uso de CPU que operaciones de E/S) tiene más probabilidades de tener cambios de contexto no voluntarios, ya que tiende a utilizar la CPU de manera intensiva y puede ser interrumpido por el planificador para permitir que otros procesos se ejecuten.</p>

4. Ejercicio practico:

<p align="justify">Utilizando un sistema Linux, escriba un programa en C que cree un proceso hijo (fork)
que finalmente se convierta en un proceso zombie. Este proceso zombie debe
permanecer en el sistema durante al menos 10 segundos.
Los estados del proceso se pueden obtener del comando: ps -l.</p>

```c++
#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>

int main() {
    pid_t child_pid = fork();

    if (child_pid > 0) {
        // Proceso padre
        sleep(10); // Espera 10 segundos
        system("ps -l"); // Mostrar el estado del proceso hijo
    } else if (child_pid == 0) {
        // Proceso hijo
        exit(0); // Salir inmediatamente para convertirse en zombie
    }

    return 0;
}
```

resultado:
```bash
desconocido502@ubuntu:~/Documents/GitHub/so1_actividades_201902502/actividad6$ ./program.sh
Compilación exitosa. Ejecutando programa...
F S   UID     PID    PPID  C PRI  NI ADDR SZ WCHAN  TTY          TIME CMD
0 S  1000   14959   14897  0  80   0 -  2786 do_wai pts/1    00:00:00 bash
0 S  1000   16194   14959  0  80   0 -  2408 do_wai pts/1    00:00:00 program.sh
0 S  1000   16203   16194  0  80   0 -   591 do_wai pts/1    00:00:00 main
1 Z  1000   16204   16203  0  80   0 -     0 -      pts/1    00:00:00 main <defunct>
0 S  1000   16280   16203  0  80   0 -   654 do_wai pts/1    00:00:00 sh
4 R  1000   16281   16280  0  80   0 -  2854 -      pts/1    00:00:00 ps
desconocido502@ubuntu:~/Documents/GitHub/so1_actividades_201902502/actividad6$
```