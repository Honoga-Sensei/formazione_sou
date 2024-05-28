# PING PONG
## Introduction

In this folder you can find a basic `Vagrant` project which with instrument like `Ansible` and `Docker` can be usefull to start stunding on process automatization.

With this particular scenario we will set up 2 virtual machine with Vagrant, each one with a nodejs container managed by Docker, and, since we want the containers tu run only one at the time on the machines and swap every 60 seconds, the command will be managed by Ansible

## Content

Inside the directory there are few different files:    

`Vagrantfile` is the one containing the configurations for the VM;    

`Dockerfile` inside this there are the configuration to create the image of the container;        

`migration.sh` is a script which the Dockerfile refers to to get the scrip wich explain what the container must do once is running;     

`playbook.yml` contains all the Ansible commands configuration, like installing Docker, creating the container and managing it;     

`inventory` contains info on the hosts which is used by the playbook to know which opne to target for the commands.     

All this together are all the file needed to make this project run.

## How to start

First to make shure everything run as intended be shure to have `virtualbox`, `vagrant`, `ansible`, `docker`, and `sshpass` installed on the machine, if you dont have it installe, you can you the following shell command:

`Virtualbox`: https://www.virtualbox.org/wiki/Downloads

```
$ sudo apt install -y vagrant
$ sudo apt install -y ansible
$ sudo apt install -y docker.io
$ sudo apt install -y sshpass
```

Once everything ins installed, you can moove through the shell to the directory containing the all the files, and just by using the shell command:
```
$ vagrant up
```
Once you run the command, vagrant will start creating and provisioning the machine with all the info inside the playbook, and in its turn crating the container through the docker file.
Once everything is we will have 2 VM called `node1` and `node2` and in both of them there will be a container called `migration_node_container`. Now we just need to get inside the VM anc check if everything is running as intended with the following commands:

```
$ vagrant ssh node1    #or node 2 depending which one you want to check; This allow us to connect in ssh with the VM
node1$ sudo docker ps -a    #This will show all running containers their status, and infos included since when is running
```
The containers should be running alternating every 60 seconds on the machines









