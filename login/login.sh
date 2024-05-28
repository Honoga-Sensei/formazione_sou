#! /bin/bash

#check login dir existance or create it
[ -d /Users/$USER/Desktop/login ] || mkdir /Users/$USER/Desktop/login 

#check username.txt existance or create it
[ -f /Users/$USER/Desktop/login/username.txt ] || touch /Users/$USER/Desktop/login/username.txt

#check password.txt existance or create it
[ -f /Users/$USER/Desktop/login/password.txt ] || touch /Users/$USER/Desktop/login/password.txt	 

#ask if user already has account
read -p "Do you have an account?(Y/N)  " confirmation

#check existing account
if [[ "$confirmation" =~ [Yy] ]]; then
	
	for i in {1..3} 
	do

		read -p "username: " username
		read -p "password: " password

#check credential inside txt file
        	if grep "$username" /Users/$USER/Desktop/login/username.txt>/dev/null && grep "$password" /Users/$USER/Desktop/login/password.txt>/dev/null; then

				echo "Welcome back $username"
				break
			
		else	
			
			k=$((3-i))
			echo "Wrong credential, $k attemps remaining"

		fi

	done

#create new account
elif [[ "$confirmation" =~ [Nn] ]]; then

        read -p "username for new account:  " newuser

#if user already exist ask for a new one
        while grep "$newuser" /Users/$USER/Desktop/login/username.txt>/dev/null
        do      

                read -p "Username already taken, try again:  " newuser

        done    

        read -p "password for new account:  " newpass

        echo $newuser >> /Users/$USER/Desktop/login/username.txt
        echo $newpass >> /Users/$USER/Desktop/login/password.txt

else

        echo "Invalid character"

fi

 
