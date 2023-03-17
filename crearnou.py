#!/usr/bin/env python3

import os
import shutil
import sys
# Obtener el directorio recibido como parámetro
dir = sys.argv[1]

# Crear el directorio si no existe
os.makedirs(dir, exist_ok=True)

# Leer el archivo recents.log línea por línea
with open('resultat/recents.log', 'r') as f:
  for line in f:
    # Obtener la ruta del archivo original
    orig = line.strip().replace('/home/joel/Desktop/FSO/FSO-prac1/', '')
    print(orig)
    # Obtener la ruta del archivo de destino
    dest = os.path.join(dir, os.path.dirname(orig))
    # Crear el directorio destino si no existe
    os.makedirs(dest, exist_ok=True)
    # Copiar el archivo original al directorio destino conservando la fecha de modificacion y creacion
    shutil.copy2(orig, dest)
