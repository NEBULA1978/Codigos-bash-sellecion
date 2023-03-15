#!/bin/bash

# Definir un array con los nombres de los archivos .sh
archivos=("07_direccion_ip.sh" "09_usuario_conectado.sh" "copiar-lineas.sh" "menubase8-automatizando4.sh" "menubase8.sh" "menubase-mpdificado-busquedas.sh" "menubase-nombres-archivos-crear.sh" "menubase.sh" "mover-lineas2.sh" "mover-lineas.sh")

# Iterar sobre el array y ejecutar cada programa
for archivo in "${archivos[@]}"
do
    echo "Ejecutando $archivo"
    ./$archivo
    wait
done

# Fin del script
echo "Todos los programas han sido ejecutados."
