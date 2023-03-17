#!/bin/bash

echo "1: Je wilt de hele teringbende weggooien"
echo "2: Je wilt hele andere dingen doen"
echo "Kies dan:"
read number

if [[ $number =~ ^[0-9]+$ ]]; then
  echo "Oke, dan gaat alles weg" 
  vagrant destroy -f
else
  echo "Dat is geen nummer kut"
fi
