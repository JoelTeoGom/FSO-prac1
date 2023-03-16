#!/bin/bash

#5.- Crearem un script bash comptot.sh i un script python comptot.py que
#usant la funció compdir.sh compari les dues rutes que rebrà per paràmetre de
#manera recursiva. També volem que indiqui per la sortida estàndard el
#percentatge total de similitud de les dues rutes rebudes per paràmetre. I que
#en l'arxiu recents.log i hi hagi la informació de totes les rutes absolutes més noves.
rm resultat/resultat.txt
rm resultat/recents.log

dir1=$1
dir2=$2

find $dir1 -type d  > t1.txt
find $dir2 -type d  > t2.txt

n=0
suma=0
while IFS= read -r root1
do

  while IFS= read -r root2
  do
    ./compdir.sh $root1 $root2
    suma=$(echo "scale=2; $suma + $(cat resultat/resultatDir.txt | sed -n '$p' | sed 's/%//' | awk '{print $7}')" | bc)
    let n=n+1
    echo $n
  done < t2.txt

done < t1.txt

p_similitud=$(echo "scale=2; $suma / $n" | bc)
echo "Les rutes [$dir1 || $dir2]  son $p_similitud% semblant" >> resultat/resultatRoot.txt

rm t1.txt t2.txt

#invers i exponenciacio modular.