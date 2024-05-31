# Step 6

## Modifying User Password Expiry and Warnings

In the command line, type the following command to edit the login configuration file login.sedf:
```
$ sudo vi /etc/login.sedf
```
Search for the following entries in the file and change their values to suit your preferences. In our case, passwords will have a maximum duration of 90 days and users will receive a warning 5 days before expiry.
```
PASS_MAX_DAYS 90
PASS_MIN_DAYS 0
PASS_WARN_AGE 5
```

## Creating 5 Users with Different Names

To create a new user on a Linux machine, you can use the following command:
```
$ sudo adduser [option] [user_name]
$ sudo passwd [user_name]
```
Note that you could also use the `adduser -p [password]` option to create an encrypted password; however, it is not recommended because this password would be visible if the command history is retrieved.

To add an existing user or a new user to a group, you can use the -G option:
```
$ sudo adduser -g [gruppo] [user_name]
```

## Creating RSA Keys and Authenticating via SSH on the Server

To create an RSA key for SSH, execute the `ssh-keygen` command in the console, which will generate the keys in the `$HOME/.ssh/ directory`. This step should be performed on the client from which you want to connect. Here is the command and its output:
```
$ ssh-keygen
Generating public/private rsa key pair.
Enter file in which to save the key ($HOME/.ssh/id_rsa):
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in $HOME/.ssh/id_rsa.
Your public key has been saved in $HOME/.ssh/id_rsa.pub.
The key fingerprint is:
SHA256:xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
The key's randomart image is:
+---[RSA 2048]----+
```
Once this is done, you can proceed with the SSH connection from the client using the `ssh-copy-id` command with the `-i` option, which allows you to copy the key into the specified file. The directory, username, and IP refer to the server.
```
$ ssh-copy-id -i $HOME/.ssh/id_rsa.pub [username]@[ip]
```
Once the key is copied, you can simply connect using the server's credentials:
```
$ ssh [username]@[ip]
```

