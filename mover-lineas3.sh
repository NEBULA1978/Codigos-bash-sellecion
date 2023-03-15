#!/bin/bash

# //////////////////////////////////////////////////////

echo "Introduce el nombre del archivo:"
ls *.sh
read file_name
cat "$file_name"
echo "Introduce la línea de inicio:"
read start_line
echo "Introduce la línea final:"
read end_line
echo "¿Cuántos archivos .txt quieres crear?"
read num_files

# Crear un archivo temporal para almacenar el archivo modificado
temp_file=temp_$file_name
cp "$file_name" "$temp_file"

# Calcular el número total de líneas que se desean mover
num_lines=$((end_line - start_line + 1))

for i in $(seq 1 $num_files)
do
  for j in $(seq 1 $num_lines)
  do
    sed -i "${start_line}i\ " "$temp_file"
  done
  cp "$temp_file" "file$i.txt"
done

# Eliminar el archivo temporal
rm "$temp_file"

# En este ejemplo, se utiliza el rango especificado por el usuario para calcular el número total de líneas que se desean mover. Luego, el segundo bucle for se ajusta para iterar sobre este número de líneas en lugar de utilizar seq para generar una secuencia de números. Esto asegura que el script copie las líneas correctas en los archivos .txt requeridos.