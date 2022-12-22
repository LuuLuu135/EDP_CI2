#!/bin/bash

install (){
	SYNC_PATH=$(pwd)/script/syncc/sync.txt
	sed "s|\#reemplazame|$SYNC_PATH|" servicio/service.template > servicio/servicio.service
	sudo cp servicio/servicio.service /etc/systemd/system
	sudo cp servicio/servicio.timer /etc/systemd/system
	sudo systemcl daemon-reload
	sudo systemctl start servicio.timer

	sudo docker-compose up --build

}

install
