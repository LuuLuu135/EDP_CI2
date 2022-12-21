#!/bin/bash 

#touch sync.txt

fechaincial=$(stat -c %y script/suncc/sync.txt)

while true
do	

	
	sleep 1

	modificacion=$(stat -c %y script/syncc/sync.txt)
	
	if [[ "$fechaincial" != "$modificacion"  ]] ;then

		#Guardo solo el numero de venta
		venta=$(curl -X GET 127.0.0.1:5000/usd 2>/dev/null |jq .venta)

		#Guardo solo el numero de Compra
		compra=$(curl -X GET 127.0.0.1:5000/usd 2>/dev/null |jq .compra)

		echo $(date +%Y-%m-%d_%H:%M) , $compra , $venta >> script/syncc/historico.txt
		
		fechaincial=$modificacion
	fi	

done
