#!/bin/bash

function crearnou() {
    directori="$1"
    while [ ! -d "$directori" ]
    do
        # demanem al usuari que introdueixi un directori
        read -p "La ruta especificada no és vàlida. Introdueix una ruta de directori vàlida: " directori
    done

    # llegim les rutes del fitxer recents.log i les guardem en una llista
    rutes=($(cat recents.log))

    # iterem sobre cada ruta i copiem el fitxer o directori a dins el directori indicat
    for ruta in "${rutes[@]}"
    do
        # comprovem si la ruta és un arxiu o directori
        tipus=$(tipus "$ruta")
        if [ "$tipus" == 1 ]; then
            # si és un arxiu, copiem el contingut al directori indicat sense modificar les dates
            cp -p "$ruta" "$directori"
        elif [ "$tipus" == 2 ]; then
            # si és un directori, copiem el contingut recursivament al directori indicat sense modificar les dates
            cp -rp "$ruta" "$directori"
        fi
    done
}







