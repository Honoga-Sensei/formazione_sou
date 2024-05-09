#! /bin/bash

read -p "Enter name" name

read -p "Continue? (Y/N)" confirm 

if [$confirm == [Yy]]; then
 
	echo "Welcome $name!"
else

	echo "See you soon!"
fi
