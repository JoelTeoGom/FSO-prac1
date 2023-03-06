#!/bin/bash

# Función para comparar dos archivos de texto
function compfitxer {
    # Comprobamos que se han pasado dos argumentos
    if [ $# -ne 2 ]; then
        echo "Error: se deben proporcionar dos archivos como argumentos"
        exit 1
    fi

    # Comparamos los archivos con la opción -Bbiw para ignorar las líneas vacías, los espacios en blanco y las mayúsculas y minúsculas
    diff -Bbiw --ignore-case "$1" "$2" 2> >(grep '^<' >&2)

    # Calculamos el porcentaje de similitud entre los archivos
    num_lines_iguales=$(diff -ibBw --ignore-case "$1" "$2" | grep -c '^<')
    num_lines_total=$(wc -l <(cat "$1" "$2"))
    porcentaje_similitud=$(bc -l <<< "scale=2; $num_lines_iguales / $num_lines_total * 100")
    echo "Porcentaje de similitud: $porcentaje_similitud%"
}

# Ejemplo de uso de la función
compfitxer $1 $2