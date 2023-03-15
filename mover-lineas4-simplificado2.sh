#!/bin/bash

# Obtener la lista de archivos en el directorio actual
files=$(ls)

# Mostrar un menú de selección de archivos
echo "Selecciona el archivo que deseas procesar:"
select file_name in $files
do
  # Verificar si el usuario ha seleccionado un archivo válido
  if [ -n "$file_name" ]; then
    break
  else
    echo "Selección inválida. Por favor, introduce un número del 1 al $(ls | wc -l) para seleccionar un archivo."
  fi
done

# Mostrar el contenido del archivo seleccionado
batcat "$file_name"

# Solicitar al usuario el archivo donde desea insertar las líneas y mostrar su contenido
echo "Selecciona el archivo donde quieres insertar las líneas:"
select insert_file in $files
do
  # Verificar si el usuario ha seleccionado un archivo válido
  if [ -n "$insert_file" ]; then
    batcat "$insert_file"
    break
  else
    echo "Selección inválida. Por favor, introduce un número del 1 al $(ls | wc -l) para seleccionar un archivo."
  fi
done

# Solicitar al usuario el rango de líneas o la línea que desea copiar y la línea de inserción en el archivo de texto generado
echo "Introduce el rango de líneas o la línea que deseas copiar (por ejemplo, 5 o 2-7):"
read line_range
echo "¿En qué línea quieres insertar las líneas?"
read insert_line
echo "¿Cuántos archivos de texto quieres crear?"
read num_files

# Crear un archivo temporal para almacenar el archivo modificado
temp_file=temp_$file_name
cp "$file_name" "$temp_file"

# Copiar las líneas especificadas por el usuario en los archivos de texto requeridos
for i in $(seq 1 $num_files)
do
  # Utilizar sed para seleccionar el rango de líneas y head para seleccionar el número de líneas especificado por el usuario
  # Luego, insertar las líneas seleccionadas en el archivo de texto generado en la línea especificada por el usuario
  if [[ "$line_range" =~ ^[0-9]+$ ]]; then
    sed -n "${line_range}p" "$temp_file" | sed "${insert_line}i\ " > "file$i.txt"
  elif [[ "$line_range" =~ ^([0-9]+)-([0-9]+)$ ]]; then
    start_line="${BASH_REMATCH[1]}"
    end_line="${BASH_REMATCH[2]}"
    num_lines=$((end_line - start_line + 1))
    sed -n "${start_line},${end_line}p" "$temp_file" | head -n "$num_lines" | sed "${insert_line}i\ " > "file$i.txt"
  else
    echo "Entrada inválida. Por favor, introduce un número o un rango de números separados por un guión (por ejemplo, 5 o 2-7)."
    exit 1
  fi
  
  # Insertar las líneas seleccionadas en el archivo seleccionado por el usuario
  sed "${insert_line}r file$i.txt" "$insert_file" > temp_file
  mv temp_file "$insert_file"
done

# Eliminar los archivos temporales
rm "$temp_file" file*.txt

# Es un script de shell que permite al usuario seleccionar un archivo de texto, seleccionar un archivo de destino para insertar las líneas seleccionadas y luego copiar las líneas especificadas por el usuario en los archivos de texto requeridos.

# El script muestra al usuario un menú de selección de archivos, muestra el contenido del archivo seleccionado, solicita al usuario el archivo donde desea insertar las líneas y muestra su contenido, solicita al usuario el rango de líneas o la línea que desea copiar y la línea de inserción en el archivo de texto generado, y finalmente copia las líneas especificadas por el usuario en los archivos de texto requeridos y las inserta en el archivo seleccionado.

# El script utiliza comandos como ls, select, sed y head para realizar las operaciones necesarias. El código ha sido actualizado según las peticiones del usuario para mostrar el archivo de destino antes de solicitar la línea donde se insertarán las líneas seleccionadas.