import os

def crearnou(directori):
    while not os.path.isdir(directori):
        # demanem al usuari que introdueixi un directori
        directori = input("La ruta especificada no és vàlida. Introdueix una ruta de directori vàlida: ")

    # llegim les rutes del fitxer recents.log i les guardem en una llista
    with open("recents.log", "r") as f:
        rutes = f.readlines()
    rutes = [ruta.strip() for ruta in rutes]

    # iterem sobre cada ruta i copiem el fitxer o directori a dins del directori indicat
    for ruta in rutes:
        # comprovem si la ruta és un arxiu o directori
        if os.path.isfile(ruta):
            # si és un arxiu, copiem el contingut al directori indicat sense modificar les dates
            os.system(f"cp -p {ruta} {directori}")
        elif os.path.isdir(ruta):
            # si és un directori, copiem el contingut recursivament al directori indicat sense modificar les dates
            os.system(f"cp -rp {ruta} {directori}")
