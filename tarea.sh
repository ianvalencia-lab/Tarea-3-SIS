#!/bin/bash
salida="Datos.txt"

echo "Tiempo(seg), CPU_(%),Memoria_libre(%),Disco_libre(%)" > "$salida"

for (( t=60; t<=300; t+=60 ))
do

echo "Tomando medicion, tiempo transcurrido: $t segundos"

cpu_idle=$(top -bn1 | grep "Cpu(s)" | awk '{print $8}')
mem_total=$(free | grep Mem | awk '{print $2}')
mem_libre=$(free | grep Mem | awk '{print $7}')
mem_libre_porcent=$((100*mem_libre/mem_total))

dis_usado=$(df / | tail -1 | awk '{print $5}' | tr -d '%')
dis_libre=$((100 - dis_usado))

echo "$t,$cpu_idle,$mem_libre_porcent,$disco_libre" >> "$salida"
sleep 60 
done 

