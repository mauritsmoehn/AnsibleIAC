#!/bin/bash

#Functie die het RAM aanpast van een server. Gebruikt 2 argumenten, de naam van de webserver en de hoeveelheid RAM die wordt toegekend
function CHANGE_RAM () {
        sed -i "s|$1.memory =.*|v.memory = $2|g" Vagrantfile
}

echo "welke taak wil je uitvoeren?"

select task in\
	"Werkgeheugen databaseserver aanpassen"\
	"Aantal webservers aanpassen"
do
	if [ "$task" = "Werkgeheugen databaseserver aanpassen" ];
	then
		echo "Van welke server wil je het RAM-memory aanpassen?"
		read server
		echo "Hoeveel MB ram wil je de databaseserver geven?"
		read varMB
		CHANGE_RAM $server $varMB
	break
	elif [ "$task" = "Aantal webservers aanpassen" ];
	then
		echo ""
	break
	else
		echo "Selecteer een geldige taak"
	fi
done
