#!/usr/bin/env python3
import os
import subprocess
import shutil
import sys


if os.path.exists("resultat/resultat.txt"):
    os.remove("resultat/resultat.txt")
if os.path.exists("resultat/recents.log"):
    os.remove("resultat/recents.log")

dir1 = sys.argv[1]
dir2 = sys.argv[2]

with open("t1.txt", "w") as t1_file:
    subprocess.run(["find", dir1, "-type", "d"], stdout=t1_file)

with open("t2.txt", "w") as t2_file:
    subprocess.run(["find", dir2, "-type", "d"], stdout=t2_file)

n = 0
suma = 0
with open("t1.txt") as t1_file:
    for root1 in t1_file:
        with open("t2.txt") as t2_file:
            for root2 in t2_file:
                subprocess.run(["./compdir.sh", root1.strip(), root2.strip()])
                with open('resultat/resultatDir.txt', 'r') as archivo:
                    #seleccionem penultima fila, despres la columna 7 (index 6), eliminem % i pasem a float
                    similitud = float(archivo.read().split("\n")[-2].split()[6].replace("%", ""))   
                suma += similitud
                n += 1

p_similitud = suma / n
print(f"Les rutes [{dir1} || {dir2}] són {p_similitud:.2f}% semblant")

#en mode append per no borrar el contingut i aixi poder enganxar-ho al final
with open("resultat/resultatRoot.txt", "a") as resultat_file:
    resultat_file.write(f"Les rutes [{dir1} || {dir2}] són {p_similitud:.2f}% semblant\n")

os.remove("t1.txt")
os.remove("t2.txt")
