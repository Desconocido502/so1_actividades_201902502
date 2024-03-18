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
