#!/bin/bash

# Script para copiar un rango de líneas de un archivo y pegarlas en un archivo de texto

# Solicitar al usuario el archivo de origen y mostrar su contenido
echo "Introduce el nombre del archivo de origen:"
ls 
read source_file
batcat "$source_file"

# Solicitar al usuario el rango de líneas a copiar
echo "Introduce la línea de inicio:"
read start_line
echo "Introduce la línea final:"
read end_line

# Solicitar al usuario el número de líneas a copiar y la línea de inserción en el archivo de texto generado
echo "¿Cuántas líneas quieres copiar?"
read num_lines
echo "¿En qué línea quieres insertar las líneas?"
read insert_line
echo "¿Cuántos archivos de texto quieres crear?"
read num_files

# Crear un archivo temporal para almacenar el archivo modificado
temp_file=temp_$source_file
cp "$source_file" "$temp_file"

# Copiar las líneas especificadas por el usuario en los archivos de texto requeridos
for i in $(seq 1 $num_files)
do
  # Utilizar sed para seleccionar el rango de líneas y head para seleccionar el número de líneas especificado por el usuario
  # Luego, insertar las líneas seleccionadas en el archivo de texto generado en la línea especificada por el usuario
  sed -n "${start_line},${end_line}p" "$temp_file" | head -n "$num_lines" | sed "${insert_line}i\ " > "file$i.txt"
done

# Eliminar el archivo temporal
rm "$temp_file"

# descripción detallada de lo que hace este script:

#     Solicita al usuario el nombre del archivo de origen que contiene las líneas que desea copiar, y muestra su contenido utilizando el comando batcat para mejorar la visualización.

#     Solicita al usuario el rango de líneas que desea copiar del archivo de origen, es decir, la línea de inicio y la línea final.

#     Solicita al usuario el número de líneas que desea copiar del archivo de origen y la línea en la que desea insertar estas líneas en el archivo de texto generado.

#     Solicita al usuario el número de archivos de texto que desea crear.

#     Crea un archivo temporal para almacenar el archivo de origen modificado.

#     Copia las líneas especificadas por el usuario en los archivos de texto requeridos utilizando el comando sed. Este comando selecciona el rango de líneas especificado por el usuario, utiliza head para seleccionar el número de líneas especificado por el usuario, y luego utiliza sed para insertar estas líneas en el archivo de texto generado en la línea especificada por el usuario.

#     Elimina el archivo temporal.

# En resumen, este script solicita al usuario información sobre qué líneas desea copiar del archivo de origen, cómo desea insertar estas líneas en los archivos de texto generados y cuántos archivos de texto desea crear. Luego, utiliza comandos como sed, head y cat para realizar las operaciones de copia e inserción en los archivos de texto.