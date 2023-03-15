#!/bin/bash

# Genera cada vez nobres diferentes de una lista elige aleatoriamente y repite 

# # Lista de nombres
# nombres=(Pedro Juan María Sofía Miguel Lucía Carlos Ana Isabel Marta)

# # Número de nombres en la lista
# num_nombres=${#nombres[@]}

# # Bucle para generar 10 nombres aleatorios
# for i in {1..10}; do
#   # Generar un número aleatorio entre 0 y el número total de nombres en la lista
#   random_index=$(( $RANDOM % $num_nombres ))
  
#   # Imprimir el nombre correspondiente al índice aleatorio
#   echo ${nombres[$random_index]}
# done


# /////////////////////////////////////////////////////////////
# /////////////////////////////////////////////////////////////

# Lista de nombres
nombres=(Pedro Juan María Sofía Miguel Lucía Carlos Ana Isabel Marta)

# Número de nombres en la lista
num_nombres=${#nombres[@]}

# Archivo de salida
archivo_salida="nombres-random.txt"

# Bucle para generar 10 nombres aleatorios
for i in {1..10}; do
  # Generar un número aleatorio entre 0 y el número total de nombres en la lista
  random_index=$(( $RANDOM % $num_nombres ))
  
  # Imprimir el nombre correspondiente al índice aleatorio y añadirlo al archivo de salida
  nombre_aleatorio=${nombres[$random_index]}
  echo $nombre_aleatorio >> $archivo_salida
done

# Este código creará un archivo de texto llamado "nombres-random.txt" en el directorio actual y añadirá los 10 nombres aleatorios generados a ese archivo en cada ejecución del script. Si el archivo ya existe, los nuevos nombres se añadirán al final del archivo existente.