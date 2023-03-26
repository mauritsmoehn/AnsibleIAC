#!/bin/bash

#Functie die het RAM aanpast van een server. Gebruikt 2 argumenten, de naam van de webserver en de hoeveelheid RAM die wordt toegekend
function CHANGE_RAM () {
        sed -i "s|$1.memory =.*|$1.memory = $2|g" Vagrantfile
	vagrant reload
}

#Functie die het aantal webservers aanpast. Gebruikt 1 argument. Past de for-loop aan in de Vagrantfile
function CHANGE_WEBSERVERS () {
	sed -i "s|aantalWebservers =.*|aantalWebservers = $1|g" Vagrantfile
	vagrant reload
}

echo "welke taak wil je uitvoeren?"

select task in\
	"Werkgeheugen van een server aanpassen"\
	"Aantal webservers aanpassen"
do
	if [ "$task" = "Werkgeheugen van een server aanpassen" ];
	then
		echo "Van welke server wil je het geheugen aanpassen?"
		read server
		echo "Hoeveel MB geheugen wil je toekennen?"
		read varMB
		CHANGE_RAM $server $varMB
	break
	elif [ "$task" = "Aantal webservers aanpassen" ];
	then
		echo "Hoeveel webservers wil je actief hebben"
		read actieveWebservers
		CHANGE_WEBSERVERS $actieveWebservers
	break
	else
		echo "Selecteer een geldige taak"
	fi
done
