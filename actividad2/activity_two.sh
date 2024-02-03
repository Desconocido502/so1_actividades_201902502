# !/bin/bash
read GITHUB_USER
curl -s https://api.github.com/users/$GITHUB_USER > githubUser.json
# Almacenar los valores
export GITHUB_ID=$(jq .id githubUser.json)
export GITHUB_DATE=$(jq .created_at githubUser.json)
# Crear mensaje
export MESSAGE="Hola $GITHUB_USER User ID $GITHUB_ID Cuenta fue creada el $GITHUB_DATE"
# Escribir mensaje en pantalla
echo $MESSAGE
# Escribir mensaje en archivo
path="/tmp/$(date +%Y-%m-%d)"
mkdir -p "$path"
logfile="$path/saludos.log"
touch "$logfile"
echo $MESSAGE >> $logfile