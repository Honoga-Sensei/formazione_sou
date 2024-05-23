# Step 5

## Setup VM RockyLinux and Debian

Install the virtual machines RockyLinux and Debian throught the .iso which can be found at the following web-sites:
RockyLinux https://rockylinux.org/download;      
Debian https://www.debian.org.     

##  Create partition on the VM

To part the device, we can use the `parted` command to initialize the disk configuration mode, in which we can use `print` command to have a look
at the aviable partition on the device.
```
$ sudo parted /dev/sDX
(parted) print
```

To part the machine we will then use the comand `mkpart`
```
(parted) mkpart
Partition type? primary/extended? [tipo di partizione desiderata]
File system type? [ext2]? [tipo di file system]
Start? [byte di partenza di allocazione]
End? [byte finale di allocazione]
```

## Install Apache Web Server

Verify that the packets inside the system are up to date:
```
$ sudo dnf update -y
```

Then we procide with the installation of `http` package, to then start Apache service.
```
$ sudo dnf install http -y
$ sudo systemctl start httpd
```

Now we need to allow `HTTP` and `HTTPS` traffic through the firewall with following command:
```
$ sudo firewall-cmd --permanent --zone=public --add-service=http
$ sudo firewall-cmd --permanent --zone=public --add-service=https
$ sudo firewall-cmd --reload
```
Once the server is up we can manage it with the commands:
```
$ sudo systemctl stop httpd
$ sudo systemctl start httpd
$ sudo systemctl restart httpd
$ sudo systemctl status httpd
```

To verify the connectivity of our Apache server with another device, we can use `curl` to try to connect to it.
```
$ curl [ip_server]
```
