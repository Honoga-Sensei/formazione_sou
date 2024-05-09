#! /bin/bash

#check login dir existance or create it
if [ ! -f /Users/$USER/Desktop/login ]; then

	mkdir /Users/$USER/Desktop/login
fi 

#check username.txt existance or create it
if [ ! -f /Users/$USER/Desktop/login/username.txt ]; then

	touch /Users/$USER/Desktop/login/username.txt
fi

#check password.txt existance or create it
if [ ! -f /Users/$USER/Desktop/login/password.txt ]; then
	
	touch /Users/$USER/Desktop/login/password.txt	 
fi

#ask if user already has account
read -p "Do you have an account?(Y/N)  " confirmation

#check existing account
if [ $confirmation == "y" ] || [ $confirmation == "Y" ]; then
	
	for i in {1..3} 
	do

		read -p "username: " username
		read -p "password: " password

#check credential inside txt file
                if [ $(grep -c "$username" /Users/$USER/Desktop/login/username.txt) == 1 ] && [ $(grep -c "$password" /Users/$USER/Desktop/login/password.txt) == 1 ]; then

				echo "Welcome back $username"
				break
			
		else	
			
			k=$((3-i))
			echo "Wrong credential, $k attemps remaining"

		fi

	done

#create new account
elif [ $confirmation == "n" ] || [ $confirmation == "N" ]; then

        read -p "username for new account:  " newuser

#if user already exist ask for a new one
        while [ $(grep -c "$newuser" /Users/$USER/Desktop/login/username.txt) == 1 ]; 
        do      

                read -p "Username already taken, try again:  " newuser

        done    

        read -p "password for new account:  " newpass

        echo $newuser >> /Users/$USER/Desktop/login/username.txt
        echo $newpass >> /Users/$USER/Desktop/login/password.txt

else

        echo "Invalid character"

fi

 
