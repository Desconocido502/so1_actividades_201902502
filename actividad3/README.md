### Para crear un systemd de tipo servicio y ejecutar un script que imprima un saludo con la fecha actual se necesita crear un archivo *.service que se guardara en la carpeta /etc/systemd/system, al ejecutarse este mostrara la el contenido al ejecutar el script.

### En primer lugar hay que crear un archivo de extension .sh el cual contenga la fecha actual y un saludo.
<pre>
#!/usr/bin/env bash
echo "Fecha $(date +%d/%m/%Y)"
echo "Hola mundo!..." </pre>

### Luego se procede a crear el archivo .service en la carpeta antes mensionada /etc/systemd/system, con la siguiente informacion, en donde ExectStart debe estar la ruta completa junto con el archivo del script, en este caso lo ubico en la carpeta /home/valerio/ 

La estructuda del archivo es la siguiente:
<pre>
[Unit]
Description=Fecha actual y presentacion

[Service]
Type=simple
ExecStart=/usr/bin/bash /home/desconocido502/Documents/GitHub/so1_actividades_201902502/actividad3/activity3.sh

[Install]
WantedBy=multi-user.target</pre>

## Seguido, se debe escribir unos comandos para habilitar y ejecutar el servicio correctamente, los cuales son:

<pre>systemctl enable activity3.service</pre>
<pre>systemctl start activity3.service</pre>
<pre>systemctl status activity3.service</pre>

### El primer comando permite habilitar el servicio, mientras que el segundo es para poder iniciarlo. Finalmente para ver como se ejecuto el servicio y su estado se utiliza el tercer comando.

### Al ejecutar cada uno de estos comando se tendra una salida como la siguiente.

```bash
desconocido502@ubuntu:/etc/systemd/system$ sudo nano /etc/systemd/system/activity3.service
desconocido502@ubuntu:/etc/systemd/system$ systemctl enable activity3.service
Created symlink /etc/systemd/system/multi-user.target.wants/activity3.service → /etc/systemd/system/activity3.service.
desconocido502@ubuntu:/etc/systemd/system$ systemctl start activity3.service
desconocido502@ubuntu:/etc/systemd/system$ systemctl status activity3.service
● activity3.service - Fecha actual y Saludo
     Loaded: loaded (/etc/systemd/system/activity3.service; enabled; vendor preset: enabled)
     Active: inactive (dead) since Sat 2024-02-24 13:14:27 PST; 12s ago
    Process: 21333 ExecStart=/usr/bin/bash /home/desconocido502/Documents/GitHub/so1_actividades_201902502/actividad3/activity3.>
   Main PID: 21333 (code=exited, status=0/SUCCESS)

Feb 24 13:14:27 ubuntu systemd[1]: Started Fecha actual y Saludo.
Feb 24 13:14:27 ubuntu bash[21333]: Fecha 24/02/2024
Feb 24 13:14:27 ubuntu bash[21333]: Hola mundo!...
Feb 24 13:14:27 ubuntu systemd[1]: activity3.service: Succeeded.

desconocido502@ubuntu:/etc/systemd/system$ 
```

