#!/bin/bash

#4.- Crearem una funció de la bash que compari dos directoris compdir.sh a
#nivell de fitxers. Els directoris els rebrà per paràmetre. Per a fer-ho usarem la
#funció compfitxer.sh. Aquesta funció crearà un arxiu recents.log amb la ruta
#absoluta dels fitxers modificats més recentment, i traurà per la sortida
#estàndard el percentatge de similitud dels dos directoris.

dir1=$1
dir2=$2

#seccion para resetear ficheros 
rm resultat/resultat.txt
rm resultat/recents.log

let i=1
suma=0
for archivo in $(ls $dir1)
do
    #find $dir2 -name "$archivo" >> resultat/fitDir.txt
    if [ -f $dir2/$archivo ];then
        echo "$archivo"
        ./compfitxer.sh $dir2/$archivo $dir1/$archivo
        ./mesactual.sh $dir2/$archivo $dir1/$archivo
        echo "====================================================================="
        suma=$(echo "scale=2; $suma + $(cat resultat/resultat.txt | sed -n '$p' | sed 's/%//' | awk '{print $7}')" | bc)
        echo $suma
        let i=i+1
    fi
done


n_file=$(ls $dir1 | wc -l) 

if [ $(ls $dir2 | wc -l) -gt $(ls $dir1 | wc -l) ];then
    n_file=$(ls $dir2 | wc -l) 
fi



p_similitud=$(echo "scale=2; $suma / $n_file" | bc)
echo "Els directoris [$dir1 || $dir2]  es $p_similitud% semblant" >> resultat/resultatDir.txt






