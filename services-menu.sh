#!/bin/bash

while true; do
    echo "Selecciona una opción:"
    echo "1. Listar el contenido de un fichero (carpeta)"
    echo "2. Crear un archivo de texto con una línea de texto"
    echo "3. Comparar dos archivos de texto"
    echo "4. Mostrar un ejemplo de uso de awk"
    echo "5. Mostrar un ejemplo de uso de grep"
    echo "6. Salir"
    read -p "Opción: " opcion

    case $opcion in
        1)
            # Opción 1: Listar el contenido de un fichero (carpeta)
            read -p "Introduce la ruta absoluta de la carpeta: " ruta
            if [ -d "$ruta" ]; then
                echo "Contenido de $ruta:"
                ls "$ruta"
            else
                echo "La ruta $ruta no es una carpeta válida."
            fi
            ;;
        
        2)
            # Opción 2: Crear un archivo de texto con una línea de texto
            read -p "Introduce el nombre del archivo: " archivo
            read -p "Introduce el texto a almacenar en el archivo: " texto
            echo "$texto" > "$archivo"
            echo "El archivo $archivo ha sido creado con el texto proporcionado."
            ;;
        
        3)
            # Opción 3: Comparar dos archivos de texto
            read -p "Introduce el nombre del primer archivo: " archivo1
            read -p "Introduce el nombre del segundo archivo: " archivo2
            if [ -f "$archivo1" ] && [ -f "$archivo2" ]; then
                echo "Comparando $archivo1 y $archivo2:"
                diff "$archivo1" "$archivo2"
            else
                echo "Uno o ambos archivos no existen."
            fi
            ;;
        
        4)
            # Opción 4: Ejemplo de uso de awk
            echo "Ejemplo de uso de awk para mostrar la primera columna de un archivo."
            read -p "Introduce el nombre del archivo para procesar con awk: " archivo_awk
            if [ -f "$archivo_awk" ]; then
                awk '{print $1}' "$archivo_awk"
            else
                echo "El archivo $archivo_awk no existe."
            fi
            ;;
        
        5)
            # Opción 5: Ejemplo de uso de grep
            echo "Ejemplo de uso de grep para buscar una palabra en un archivo."
            read -p "Introduce la palabra a buscar: " palabra
            read -p "Introduce el nombre del archivo para buscar con grep: " archivo_grep
            if [ -f "$archivo_grep" ]; then
                grep "$palabra" "$archivo_grep"
            else
                echo "El archivo $archivo_grep no existe."
            fi
            ;;
        
        6)
            # Opción 6: Salir del script
            echo "Saliendo del script..."
            exit 0
            ;;
        
        *)
            echo "Opción no válida. Por favor, elige una opción entre 1 y 6."
            ;;
    esac
    echo
done

