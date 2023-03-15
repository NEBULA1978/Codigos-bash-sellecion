#!/bin/bash

echo "Queremos borrar la palabra que contenga fichero y despues una A o B y termine con .txt"
echo "Solo borra los ficheros ficheroA.txt ficheroB.txt"

# Preguntar al usuario qué letras desea usar
echo "Ingrese las dos letras que desea usar (por ejemplo, C D):"
read letra1 letra2

# Eliminar los archivos que coincidan con el patrón
rm "fichero[$letra1$letra2].txt"

read foo

# ///////////////////////////////////////////

echo "Crear archivos a.txt b.txt c.htm"
echo "Solo crea archivos con las letras que le indiquemos a.txt b.txt c.htm"

# Preguntar al usuario qué letras desea usar
echo "Ingrese las dos letras que desea usar (por ejemplo, ad vd):"
read letra1 letra2

# Crear los archivos que coincidan con el patrón
touch "fichero[${letra1}${letra2}].txt"

echo "Los archivos que coinciden con el patrón se han creado."

# /////////////////////////////////////////////////////////////

# Para hacer que el script pregunte cuántos archivos .txt quieres crear, puedes agregar una línea antes del loop for que solicite al usuario que ingrese el número de archivos que desea crear. Luego, puedes almacenar la respuesta del usuario en una variable y usarla en el loop for para crear el número correcto de archivos. Aquí está un ejemplo de cómo podrías modificar el script:

echo "Introduce la línea de inicio:"
read line_number
echo "Introduce el número de líneas a desplazar:"
read lines_to_move
echo "¿Cuántos archivos .txt quieres crear?"
read num_files

for i in $(seq 1 $num_files)
do
  for j in $(seq 1 $lines_to_move)
  do
    sed -i "${line_number}i\ " Menu12.sh
  done
  touch "file$i.txt"
done


# En este ejemplo, se agrega un nuevo loop for que itera el número de archivos que el usuario quiere crear. Luego, dentro de ese loop, se utiliza el loop for original para insertar las líneas en el archivo Menu12.sh y se crea un archivo .txt con el número apropiado.