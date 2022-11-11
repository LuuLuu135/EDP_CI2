#!/bin/bash


while true 
do
	curl -X GET 127.0.0.1:5000/usd |./jq '.venta' >> ventausd.txt
	usdv=$(tail -1 ventausd.txt)

	usd=$(curl -X GET 127.0.0.1:5000/usd |./jq '.venta') 
	if [[$usdv -eq $usd ]];then
		sleep 5
	else
		curl -X GET 127.0.0.1:5000/usd |./jq '.venta' >ventausd.txt
	fi

done &> /dev/null
