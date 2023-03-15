#!/bin/bash

while :; do
    #Menu
    clear
    echo -e "\e[1;32m"
    echo " MENU SCRIPT V.1 "
    echo ""
    echo "1. Instalar programa ?¿ introduce si o no "
    echo "2. Escribe un número para ver si es igual a 5"
    echo "3. Escribe un número para ver el rango entre 5 y 10 "
    echo "5. Escribe un número ,bucle for del 0 al numero introducido vemos numeros"
    echo "6. Ver los bytes de un directorio si existe"
    echo "7. Nombre extensión número ruta"
    echo "8. Enunciado script7"
    echo "9. Ejecutando script7"
    echo "10. Ejecutando sintaxisscript"
    echo "4. Salir"
    echo ""
    #Escoger menu
    echo -n "Escoger opcion: "
    read opcion
    #Seleccion de menu
    case $opcion in
    1)
        echo "Instalar programa ?¿ introduce si o no"

        echo -n "Instalar programa? [s/n]: "
        read resultado

        if [[ $resultado == [sS] ]]; then
            echo "Instalando programa..."
        elif [[ $resultado == [nN] ]]; then
            echo "El programa no se va a instalar"
        else
            echo "Opcion invalida"
        fi

        read foo
        ;;
    2)
        echo "Escribe un número"
        echo -n "Escribe un número: "
        read valor

        if [[ $valor -ne 5 ]]; then
            echo "Tu numero no es igual a 5"
        else
            echo "Tu numero es igual a 5"
        fi

        # -gt greater than
        # -ge greater or equal
        # -lt lower than
        # -le lower or equal
        # -eq equal
        # -ne not equal
        read foo
        ;;
    3)
        echo "Escribe un número para ver el rango entre 5 y 10 "

        echo -n "Escribe un número: "
        read valor

        if [ $valor -lt 5 -o $valor -gt 10 ]; then
            echo "Tu numero está fuera  del rango [5, 10]"
        else
            echo "Tu numero está en el rango [5, 10]"
        fi

        # -a and
        # -o or
        read foo
        ;;
    5)
        echo "Escribe un número ,bucle for del 0 al numero introducido vemos numeros"
        echo -n "Escribe un número: "
        read limite

        for ((i = 0; i < $limite; i++)); do
            echo $i
        done

        read foo
        ;;
    6)
        echo "Ver los bytes de un directorio si existe"
        if [ ! -d $1 ]; then
            echo "Error: el directorio no existe"
            exit 1
        fi

        total=0
        for f in $(ls $1); do
            name="$1/$f"
            if [ -f $name ]; then
                bytes=$(ls -l $name | cut -d " " -f 5)
                echo "Fichero $name ocupa $bytes" | tr -s /
                ((total = $total + $bytes))
            fi
        done

        echo -e "\nTotal: $total"

        read foo
        ;;
    7)
        echo "Nombre extensión número ruta"
        # nombre extensión número ruta

        error() {
            echo $1
            exit 1
        }

        if [ $# -ne 4 ]; then
            error "Uso: script nombre extensión número ruta"
        fi

        if [ ! -d $4 ]; then
            error "Error: el directorio no existe"
        fi

        if [ $3 -lt 1 ]; then
            error "Error: el numero de ficheros no puede ser menor que 1"
        fi

        for ((i = 1; i <= $3; i++)); do
            name="$4/$1$i.$2"
            if [ $i -lt 10 ]; then
                name="$4/$10$i.$2"
            fi
            touch $name
            echo "Fichero $name creado" | tr -s /
        done

        read foo
        ;;
    8)
        echo "Enunciado script7"
        echo 'error() {
    echo $1
    exit 1
}

# Comprobar que el número de parámetros es correcto

# Comprobar que el directorio existe

# Recorrer cada fichero del directorio

# Guardar en una variable el nombre actual con la ruta completa

# Guardar en una variable el nombre nuevo

# Cambiar el nombre del fichero

# Imprimir lo que está haciendo el script
'
        read foo
        ;;
    9)
        echo "Ejecutando script7"

        error() {
            echo $1
            exit 1
        }

        if [ $# -ne 2 ]; then
            error "Uso: $0 prefijo directorio"
        fi

        if [ ! -d $2 ]; then
            error "Error: el directorio no existe"
        fi

        for f in $(ls $2); do
            name="$2/$f"
            new_name="$2/$1$f"
            mv $name $new_name
            echo "$name -> $new_name" | tr -s /
        done

        read foo
        ;;
    10)
        echo "Ejecutando sintaxisscript"
        # Declarar variable:
        cadena=texto
        cadena="Texto con espacios"
        numero=5

        # Para almacenar la salida de un comando en una variable
        comando=$(ls -l | tail -n +2)
        # Se puede poner dobles comillas dentro de los backticks
        comando=$(ls -l | grep "Directorio Con Espacios")

        # Acceder al valor de la variable:
        $variable

        # Condicional if:
        if [ $numero -eq 5 -o $numero -eq 7 ]; then
            # Código
        elif [ $numero -lt 3 ]; then
            # Código
        else
            # Código
        fi

        # Usar [[ ]] Para comparar cadenas, permite expresiones regulares:
        if [[ $cadena == [sS] ]]; then
            # Código
        fi

        # Para comparar números:
        #     -gt => greater than
        #     -ge => greater or equal
        #     -lt => lower than
        #     -le => lower or equal
        #     -eq => equal
        #     -ne => not equal

        # Operadores lógicos:
        #     -a => and
        #     -o => or

        # Bucle for:
        for ((i = 0; i < 5; i++)); do
            # Código, para acceder al valor de i se usa $i
        done
        # Si queremos que i se incremente con otro valor que no sea uno:
        for ((i = 0; i < 10; i += 5)); do
            # Código
        done

        # Bucle for in:
        for i in $(ls); do
            # Código
        done

        read foo
        ;;
    4) exit 0 ;;
    #Alerta
    *)
        echo "Opcion invalida..."
        sleep 1
        ;;
    esac
done
