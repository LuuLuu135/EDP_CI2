#!/bin/bash 

#Guardo solo el numero de venta
venta=$(curl -X GET 127.0.0.1:5000/usd |./jq '.venta')

#Guardo solo el numero de Compra
compra=$(curl -X GET 127.0.0.1:5000/usd |./jq '.compra')

echo $(date +%Y-%m-%d_%H:%M) , $compra , $venta >> historico.txt


while true
do
	curl -X GET 127.0.0.1:5000/usd |-jq '.compra' > compra.txt
	
	comprar=$(tail -1 compra.txt)

	curl -X GET 127.0.0.1:5000/usd |-jq '.venta' > venta.txt
         
	vender=$(tail -1 venta.txt)
	
	echo $(date  +%Y-%m-%d_%H:%M) , $compra , $venta > sync.txt

	if [[$compra -ne $comprar || $venta -ne $vender]];then

		echo $(date +%Y-%m-%d_%H:%M) , $compra , $venta >> sync.txt

	else
		sleep 5
	
	fi	

done &> /dev/null
