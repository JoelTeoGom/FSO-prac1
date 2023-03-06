#!/bin/bash


file1=$1
file2=$2
args=("$@")

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


function compfitxer(){

   #nos muestra lineas diferentes en un fichero y nos retorna el numero de lineas
   diff -Bbiw $file1 $file2 >&2
   
   #eliminamos los espacios vacios + lineas en blanco


   #obtenemeos el numero de lineas iguales
   iguales=$(grep -i -Fxf $file1 $file2 | wc -l)

   #obtenemos las lineas comparadas
   lineas1=$(wc -l $file1 | cut )
   lineas2=$(wc -l $file2)
   
   #escogemos la mas grande para hacer el calculo
   if [ $lineas1 -gt lineas2 ];then
      lineas2=$lineas1
   fi
   
}

compfitxer