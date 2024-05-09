#! /bin/bash

read -p "Enter name" name

read -p "Continue? (Y/N)" confirm && [$confirm == [Yy] || $confirm == [Yy][Ee][Ss]] || exit 1 

echo "Welcome $name"

