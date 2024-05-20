# Step 5

## Installare VM RockyLinux e Debian

Installare le virtual machine RockyLinux e Debian prendendo le relative iso dai seguenti siti:
RockyLinux https://rockylinux.org/download;      
Debian https://www.debian.org.     

##  Creare partizioni su una delle VM

Per partizionare il dispositivo possiamo utilizzare il comando `parted` per andere in modilatà di 
configurazione dei dischi, chiamando poi il comando `print` possiamo vedere com'è attualmente partito 
lo spazio sul dispositivo.
```
$ sudo parted /dev/sDX
(parted) print
```

Per partizionare poi richiamiamo il comando `mkpart`
```
(parted) mkpart
Partition type? primary/extended? [tipo di partizione desiderata]
File system type? [ext2]? [tipo di file system]
Start? [byte di partenza di allocazione]
End? [byte finale di allocazione]
```

## Installare Apache Web Server

Verificare che i pacchetti del sistema siano aggiornati con il comando:
```
$ sudo dnf update -y
```

Procediamo poi all'installazione dei pacchetti http, per seguire con l'avviamento del servizio Apache.
```
$ sudo dnf install http -y
$ sudo systemctl start httpd
```

Adesso è necessario abilitare il firewall alla trasmissione di traffico `HTTP` e `HTTPS` con i seguenti 
comandi:
```
$ sudo firewall-cmd --permanent --zone=public --add-service=http
$ sudo firewall-cmd --permanent --zone=public --add-service=https
$ sudo firewall-cmd --reload
```
Una volta avviato il server può essere gestito con i comandi:
```
$ sudo systemctl stop httpd
$ sudo systemctl start httpd
$ sudo systemctl restart httpd
$ sudo systemctl status httpd
```

Se vogliamo adesso verificare la connettività del nostro server Apache, utilizzando un altro dispositivo 
possiamo utilizzare il comando `curl` per cercare di connetterci ad esso.
```
$ curl [ip_server]
```
