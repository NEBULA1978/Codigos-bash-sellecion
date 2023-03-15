#!/bin/bash
#
while :; do
    #Menu
    clear
    echo -e "\e[1;32m"
    echo " MENU SCRIPT V.2 "
    echo ""
    echo "1. Mostrar directorio"
    echo "2. Mostrar calendario"
    echo "3. Mostrar fecha de hoy"
    echo "4. Salir"
    echo "5. Crear archivos"
    echo "6. Borrar archivos por nombre"
    echo "7. Borrar archivos por patrón"
    echo "8. Ir a la carpeta anterior"
    echo "9. Borrar archivos por ruta absoluta o relativa"
    echo "10. Crear ficheros"
    echo "11. Borrar ficheros por nombre que empiezan por una letra"
    echo "12. Crear ficheros por patrón"
    echo "13. Borrar ficheros por patrón"
    echo ""
    #Escoger menu
    echo -n "Escoger opcion: "
    read opcion
    #Seleccion de menu
    case $opcion in
    1)
        echo "Mostrando directorio"
        ls
        read foo
        ;;
    2)
        echo "Mostrando calendario"
        cal
        read foo
        ;;
    3)
        echo "Mostrando datos"
        date
        read foo
        ;;
    4)
        exit 0
        ;;
    5)
        echo "Introduce nombres de archivos separados por espacios:"
        read nombres
        touch $nombres
        read foo
        ;;
    6)
        echo "Introduce nombre de archivo a borrar:"
        read nombre
        rm $nombre
        read foo
        ;;
    7)
        echo "Introduce patrón de archivos a borrar (ejemplo: *.txt):"
        read patron
        rm $patron
        read foo
        ;;
    8)
        echo "Ir a la carpeta anterior"
        echo "CUIDADO NO BORRAR / la raiz del sistema operativo"
        cd ..
        echo "rm expresiones-regulares-sarosi/*.txt"
        read foo
        ;;
    9)
        echo "Introduce la ruta absoluta o relativa de los archivos a borrar:"
        read ruta
        rm $ruta
        read foo
        ;;
    10)
        echo "Introduce patrón de nombres de archivo a crear (ejemplo: archivo_{1..10}.txt):"
        read patron
        touch $patron
        read foo
        ;;
    11)
        echo "Introduce letra por la cual empezan los archivos a borrar:"
        read letra
        rm $letra*
        read foo
        ;;
    12)
        echo "Introduce patrón de nombres de archivo a crear (ejemplo: archivo_{1..10}.txt):"
        read patron
        touch $patron
        read foo
        ;;
    13)
        echo "Introduce patrón de archivos a borrar (ejemplo: *-*.txt):"
        read patron
        rm $patron
        read foo
        ;;
    #Alerta
    *)
        echo "Opcion invalida..."
        sleep 1
        ;;
    esac
done
