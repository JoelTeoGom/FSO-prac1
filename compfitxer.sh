#!/bin/bash

#s: que queremos buscar y remplazar
#g: sustitucion global
# -i: cambiamos el fichero directamente

#   for arg in "${args[@]}"
#   do            
#        sed -i "s/ //g" $arg 
#        sed -i '/^$/d' $arg 
#        sed -i 's/[A-Z]/\L&/g' $arg 
#        sed -i ':a; N; s/\n//; ta' $arg 
#   done

file1=$1
file2=$2
args=("$@")

function compfitxer(){

   #nos muestra lineas diferentes en un fichero y nos retorna el numero de lineas
   diff -Bbiw $file1 $file2 >&2
   
   #eliminamos los espacios vacios + lineas en blanco
   i=1
   for arg in "${args[@]}"
   do            
        sed -e "s/ //g; /^$/d" $arg  > temp${i}.txt
        let i=i+1
   done
   
   #obtenemeos el numero de lineas iguales
   let iguales=$(grep -i -Fxf temp1.txt temp2.txt | wc -l)
   let iguales2=$(grep -i -Fxf temp2.txt temp1.txt | wc -l)
      if [ $iguales2 -lt $iguales ];then 
      iguales=$iguales2
   fi

   #obtenemos las lineas comparadas, obtenemos solo el numero y lo convertimos a entero
   let lineas1=$(cat temp1.txt | wc -l)
   let lineas2=$(cat temp2.txt | wc -l)

   #escogemos la mas grande para hacer el calculo
   if [ $lineas1 -gt $lineas2 ];then 
      lineas2=$lineas1
   fi
   
   #operacion final
   echo "$iguales / $lineas2 * 100"
   operacion=$(echo "scale=2; $iguales / $lineas2 * 100" | bc)
   echo "Els fitxers [$file1 || $file2]  es $operacion% semblant" >> resultat/resultat.txt

   rm temp1.txt & rm temp2.txt

}

compfitxer