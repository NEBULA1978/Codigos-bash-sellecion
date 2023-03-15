#!/bin/bash
#Ramón Pascual

# function ayuda() {
# cat << DESCRIPCION_AYUDA
# SYNOPSIS
#     $0 Nombre_usuario
# DESCRIPCION
#   Devuelve:
# 	SI si NOMBRE_USUARIO coincide con algún usuario conectado o
# 	NO si NOMBRE_USUARIO no coincide con ningún usuario conectado
# CÓDIGOS DE RETORNO
#   1 Si el número de parámetros es distinto de 1
# DESCRIPCION_AYUDA
# }
# if [ $# -ne 1 ]; then
#   ayuda
# fi

# CONECTADO=$(who | grep $1)
# if [ -z "$CONECTADO" ]; then
#  echo "No"
# else
#  echo "SI"
# fi

# next@next-System:~/Imágenes/Codigos-bash-sellecion$ ./09_usuario_conectado.sh luis
# No
# next@next-System:~/Imágenes/Codigos-bash-sellecion$ 


# ////////////////////////////////////////////////////////
# ////////////////////////////////////////////////////////


# function ayuda() {
# cat << DESCRIPCION_AYUDA
# SYNOPSIS
#     $0 Nombre_usuario
# DESCRIPCION
#   Devuelve:
# 	SI si NOMBRE_USUARIO coincide con algún usuario conectado o
# 	NO si NOMBRE_USUARIO no coincide con ningún usuario conectado
# CÓDIGOS DE RETORNO
#   1 Si el número de parámetros es distinto de 1
# DESCRIPCION_AYUDA
# }
# if [ $# -ne 1 ]; then
#   ayuda
# fi

# CONECTADO=$(who | grep $1)
# if [ -z "$CONECTADO" ]; then
#  echo "No"
# else
#  echo "SI"
# fi 

# next@next-System:~/Imágenes/Codigos-bash-sellecion$ ./09_usuario_conectado.sh
# SYNOPSIS
#     ./09_usuario_conectado.sh Nombre_usuario
# DESCRIPCION
#   Devuelve:
#         SI si NOMBRE_USUARIO coincide con algún usuario conectado o
#         NO si NOMBRE_USUARIO no coincide con ningún usuario conectado
# CÓDIGOS DE RETORNO
#   1 Si el número de parámetros es distinto de 1
# Modo de empleo: grep [OPCIÓN]... PATRONES [FICHERO]...
# Pruebe 'grep --help' para más información.
# No

# ////////////////////////////////////////////////////////
# ////////////////////////////////////////////////////////

# function ayuda() {
# cat << DESCRIPCION_AYUDA
# SYNOPSIS
# $0 archivo_nombres
# DESCRIPCION
# Devuelve:
# SI si algún nombre en el archivo_nombres coincide con algún usuario conectado o
# NO si ningún nombre en el archivo_nombres coincide con ningún usuario conectado
# CÓDIGOS DE RETORNO
# 1 Si el número de parámetros es distinto de 1
# function ayuda() {
#   cat << DESCRIPCION_AYUDA
# SYNOPSIS
#     $0 archivo_nombres
# DESCRIPCION
#   Devuelve:
#     SI si algún nombre en el archivo_nombres coincide con algún usuario conectado o
#     NO si ningún nombre en el archivo_nombres coincide con ningún usuario conectado
# CÓDIGOS DE RETORNO
#   1 Si el número de parámetros es distinto de 1
# DESCRIPCION_AYUDA
# }

# if [ $# -ne 1 ]; then
#   ayuda
#   exit 1
# fi

# ARCHIVO=$1

# echo "Abriendo archivo: $ARCHIVO"
# while read nombre; do
#   CONECTADO=$(who | grep $nombre)
#   if [ -n "$CONECTADO" ]; then
#     echo "SI"
#     exit 0
#   fi
# done < $ARCHIVO

# echo "NO"

# Recuerda que debes hacer ejecutable el script con el comando chmod +x nombre_del_script.sh antes de ejecutarlo con ./nombre_del_script.sh nombres.txt.


# ////////////////////////////////////////////////////////////////////////////
# ////////////////////////////////////////////////////////////////////////////

# function ayuda() {
#   cat << DESCRIPCION_AYUDA
# SYNOPSIS
#     $0
# DESCRIPCION
#   Devuelve:
#     SI si algún nombre en el archivo nombres.txt coincide con algún usuario conectado o
#     NO si ningún nombre en el archivo nombres.txt coincide con ningún usuario conectado
# CÓDIGOS DE RETORNO
#   1 Si no se puede acceder al archivo nombres.txt
# DESCRIPCION_AYUDA
# }

# ARCHIVO="nombres.txt"

# echo "Abriendo archivo: $ARCHIVO"
# if [ ! -f $ARCHIVO ]; then
#   echo "No se puede acceder al archivo $ARCHIVO"
#   ayuda
#   exit 1
# fi

# while read nombre; do
#   CONECTADO=$(who | grep $nombre)
#   if [ -n "$CONECTADO" ]; then
#     echo "SI"
#     exit 0
#   fi
# done < $ARCHIVO

# echo "NO"

# Recuerda que debes hacer ejecutable el script con el comando chmod +x nombre_del_script.sh antes de ejecutarlo con ./nombre_del_script.sh.

# ////////////////////////////////////////////////////////////////////////////
# ////////////////////////////////////////////////////////////////////////////

# function ayuda() {
#   cat << DESCRIPCION_AYUDA
# SYNOPSIS
#     $0
# DESCRIPCION
#   Devuelve:
#     Muestra uno por uno los nombres en el archivo nombres.txt y luego
#     imprime SI si algún nombre en el archivo nombres.txt coincide con algún usuario conectado o
#     NO si ningún nombre en el archivo nombres.txt coincide con ningún usuario conectado
# CÓDIGOS DE RETORNO
#   1 Si no se puede acceder al archivo nombres.txt
# DESCRIPCION_AYUDA
# }

# ARCHIVO="nombres.txt"

# echo "Abriendo archivo: $ARCHIVO"
# if [ ! -f $ARCHIVO ]; then
#   echo "No se puede acceder al archivo $ARCHIVO"
#   ayuda
#   exit 1
# fi

# echo "Nombres en el archivo:"
# while read nombre; do
#   echo $nombre
#   CONECTADO=$(who | grep $nombre)
#   if [ -n "$CONECTADO" ]; then
#     echo "SI"
#     exit 0
#   fi
# done < $ARCHIVO

# echo "NO"

# next@next-System:~/Imágenes/Codigos-bash-sellecion$ ./09_usuario_conectado.sh
# Abriendo archivo: nombres.txt
# Nombres en el archivo:
# Pedro
# Juan
# María
# Sofía
# Miguel
# NO

# ////////////////////////////////////////////////////////////////////////////
# ////////////////////////////////////////////////////////////////////////////

function ayuda() {
  cat << DESCRIPCION_AYUDA
SYNOPSIS
    $0
DESCRIPCION
  Devuelve:
    Muestra uno por uno los nombres en el archivo nombres.txt y luego
    imprime NO si ningún nombre en el archivo nombres.txt coincide con ningún usuario conectado
CÓDIGOS DE RETORNO
  1 Si no se puede acceder al archivo nombres.txt
DESCRIPCION_AYUDA
}

ARCHIVO="nombres.txt"

echo "Abriendo archivo: $ARCHIVO"
if [ ! -f $ARCHIVO ]; then
  echo "No se puede acceder al archivo $ARCHIVO"
  ayuda
  exit 1
fi

echo "Nombres en el archivo:"
while read nombre; do
  echo $nombre
  CONECTADO=$(who | grep $nombre)
  if [ -n "$CONECTADO" ]; then
    echo "SI"
    exit 0
  fi
  echo "NO"
done < $ARCHIVO


# un ejemplo de código que imprime "NO" después de cada nombre en el archivo "nombres.txt