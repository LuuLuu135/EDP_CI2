#!/bin/bash

curl -X GET 127.0.0.1:5000/usd |./jq '.venta' >> ventausd.txt


