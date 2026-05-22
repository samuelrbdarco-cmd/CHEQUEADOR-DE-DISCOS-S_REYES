#!/bin/bash

# Variable con el correo del administrador
ADMIN="vj.santonjaivorra@edu.gva.es"

# Guarda la fecha actual
FECHA=$(date)

# Archivo temporal donde se guardará el informe
TMP="/tmp/informe_discos.txt"

# Encabezado del informe
echo "INFORME DE ESTADO DE DISCOS" > $TMP
echo "Fecha: $FECHA" >> $TMP
echo "-----------------------------------" >> $TMP

# Obtener el estado de absolutamente todos los discos
df -h >> $TMP

# Enviar correo con el informe completo siempre
mail -s "Informe diario discos servidor" "$ADMIN" < $TMP

# Eliminar archivo temporal
rm -f $TMP
