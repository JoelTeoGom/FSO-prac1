#!/bin/bash

# Obtener el directorio recibido como parámetro
dir=$1

# Crear el directorio si no existe
mkdir -p "$dir"

# Leer el archivo recents.log línea por línea
cat resultat/recents.log | while read line
do
  #Obtener la ruta del archivo original
  orig=$(echo "$line")
  orig="${orig#"/home/joel/Desktop/FSO/FSO-prac1/"}"
  echo $orig
  #Obtenemos la ruta del archivo de destino
  dest="$dir/$(dirname "$orig")"
  # Creamos el directorio destino si no existe
  mkdir -p "$dest"
  # Copiamos el archivo original al directorio destino
  cp -p "$orig" "$dest"

done
