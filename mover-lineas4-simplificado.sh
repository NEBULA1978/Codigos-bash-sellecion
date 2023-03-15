# #!/bin/bash

# # Solicitar al usuario el archivo de origen y mostrar su contenido
# echo "Introduce el nombre del archivo de origen:"
# ls 
# read source_file
# batcat "$source_file"

# # Solicitar al usuario el rango de líneas o la línea que desea copiar y la línea de inserción en el archivo de texto generado
# echo "Introduce la línea o el rango de líneas que quieres copiar (por ejemplo, 5 o 2-7):"
# read line_range
# echo "¿En qué línea quieres insertar las líneas?"
# read insert_line
# echo "¿Cuántos archivos de texto quieres crear?"
# read num_files

# # Crear un archivo temporal para almacenar el archivo modificado
# temp_file=temp_$source_file
# cp "$source_file" "$temp_file"

# # Copiar las líneas especificadas por el usuario en los archivos de texto requeridos
# for i in $(seq 1 $num_files)
# do
#   # Utilizar sed para seleccionar el rango de líneas y head para seleccionar el número de líneas especificado por el usuario
#   # Luego, insertar las líneas seleccionadas en el archivo de texto generado en la línea especificada por el usuario
#   if [[ "$line_range" =~ ^[0-9]+$ ]]; then
#     sed -n "${line_range}p" "$temp_file" | sed "${insert_line}i\ " > "file$i.txt"
#   elif [[ "$line_range" =~ ^([0-9]+)-([0-9]+)$ ]]; then
#     start_line="${BASH_REMATCH[1]}"
#     end_line="${BASH_REMATCH[2]}"
#     num_lines=$((end_line - start_line + 1))
#     sed -n "${start_line},${end_line}p" "$temp_file" | head -n "$num_lines" | sed "${insert_line}i\ " > "file$i.txt"
#   else
#     echo "Entrada inválida. Por favor, introduce un número o un rango de números separados por un guión (por ejemplo, 5 o 2-7)."
#     exit 1
#   fi
# done

# # # Eliminar el archivo temporal
# # rm "$temp_file"

# # En este script, se solicita al usuario el nombre del archivo de origen y se muestra su contenido utilizando el comando batcat. Luego, se le pide al usuario que introduzca el rango de líneas que desea copiar o la línea que desea copiar y la línea de inserción en el archivo de texto generado.

# # Después, se utiliza el comando sed para seleccionar el rango de líneas especificado por el usuario y el comando head para seleccionar el número de líneas especificado por el usuario. Finalmente, se utiliza sed para insertar estas líneas en el archivo de texto generado en la línea especificada por el usuario.

# # Si el usuario introduce una entrada inválida, se mostrará un mensaje de error y el script se detendrá.


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
done

# Eliminar el archivo temporal
rm "$temp_file"

# En este script, se muestra un menú de selección de archivos, se muestra el contenido del archivo seleccionado y se le pide al usuario que introduzca
