# Step 6

## Modificare scadenze e warning delle password utenti

Nella riga di comando digitare il seguente comando per editare il file di configurazione login.sedf;
```
$ sudo vi /etc/login.sedf
```
Cercare nel file le seguenti voci e modificare i valori fino a rispecchiare le proprie preferenze; 
nel nostro caso le password avranno una durata massima di 90 giorni e gli utenit avranno 5 giorni di prevviso dalla scadenza
```
PASS_MAX_DAYS 90
PASS_MIN_DAYS 0
PASS_WARN_AGE 5
```

## Creare 5 utenti con nomi diversi

Per creare un nuovo utente su una macchina linux possiamo usare il comando seguente:
```
$ sudo adduser [option] [user_name]
$ sudo passwd [user_name]
```
Notare che potremmo anche usare l'opzione `adduser -p [password]` per creare una password criptata, tuttavia
è consigliato in quanto questa sarebbe visibile in cui si recupare il comando dalla history.   
   
Per aggiungere invece un tente già esistente o un nuovo utente ad un gruppo possiamo usare l'opzione -G
```
$ sudo adduser -g [gruppo] [user_name]
```

## Creare chiavi RSA ed utenticarsi in SSH sul server

Per creare una chiave RSA in SSH bisogna eseguire in console il comando `ssh-keygen` che andrà a generare
le chiavi nella directory `$HOME/.ssh/`, questo passaggio va eseguito sul client da cui vogliamo connetterci.    
Di seguito il comando con il suo output:
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
una volta fatto ciò possiamo proseguire con il collegamento in SSH sempre dal client da cui vogliamo 
connetterci con il comando `ssh-copy-id` con l'opzione `-i` che permette di copiare la chiave all'interno
del file identificato. La dir di riferimento, l'username, e l'ip fanno riferimento al server.
```
$ ssh-copy-id -i $HOME/.ssh/id_rsa.pub [username]@[ip]
```
una volta copiata la chiave possiamo semplicemnte collegarci con i dati del server
```
$ ssh [username]@[ip]
```

