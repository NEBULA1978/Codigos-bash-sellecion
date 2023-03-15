 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
#!/bin/bash

while true; do
  # Mostrar las carpetas en el directorio actual
  echo "Carpetas en el directorio actual:"
  ls -d *

  # Preguntar al usuario qué acción desea realizar
  echo "Elija una opción:"
  echo "1. Entrar en carpeta"
  echo "2. Leer archivo"
  echo "3. Salir"
  read opcion

  if [ $opcion -eq 1 ]; then
    # Preguntar al usuario qué carpeta desea entrar
    echo "Introduce el nombre de la carpeta a la que deseas entrar:"
    read carpeta
    # Verificar si la carpeta existe
    if [ -d $carpeta ]; then
      # Entrar en la carpeta
      cd $carpeta
    else
      # Mostrar un mensaje de error si la carpeta no existe
      echo "La carpeta $carpeta no existe."
    fi

  elif [ $opcion -eq 2 ]; then
    # Preguntar al usuario qué archivo desea leer
    echo "Introduce el nombre del archivo que deseas leer:"
    read archivo
    # Verificar si el archivo existe
    if [ -f $archivo ]; then
      # Leer el archivo
      cat $archivo
    else
      # Mostrar un mensaje de error si el archivo no existe
      echo "El archivo $archivo no existe."
    fi

  elif [ $opcion -eq 3 ]; then
    # Salir del bucle
    break

  else
    # Mostrar un mensaje de error si la opción no es válida
    echo "Opción no válida."
  fi
done

# En este ejemplo, el script entra en un bucle infinito y muestra las carpetas en el directorio actual. El usuario puede elegir entre entrar en una carpeta, leer un archivo o salir del bucle. Si elige entrar en una carpeta, se pregunta el nombre de la carpeta y se verifica si existe. Si existe, se entra en la carpeta. Si elige leer un archivo, se pregunta el nombre del archivo y se verifica si existe. Si existe, se muestra su contenido. Si elige salir, se sale del bucle.
