# PING PONG
## Introduction

In this folder you can find a basic `Vagrant` project which with instrument like `Ansible` and `Docker` can be useful to start stunding on process automatization.

With this particular scenario we will set up 2 virtual machine with Vagrant, each one with a nodejs container managed by Docker, and, since we want the containers to run only one at the time on the machines and swap every 60 seconds, the command will be managed by Ansible

## Content

Inside the directory there are few different files:    

`Vagrantfile` is the one containing the configurations for the VM;    

`Dockerfile` inside this there are the configuration to create the image of the container;      

`migration.sh` is a script which the Dockerfile refers to, in order to get the scrip which explains what the container must do once is running;     

> [!NOTE]
> I'm using the Dockerfile and migration.sh so that the container keep running, but be aware that you can achive the same adding a "command: sleep infinity" inside the ansible playbook when you are creating the container instead of using those 2 files.    

`ansible.cfg` contains Ansible configuration

`playbook.yml` contains all the Ansible commands configuration, like installing Docker, creating the container and managing it;     

`inventory` contains info on the hosts which is used by the playbook to know which open to target for the commands.     

All this together are all the file needed to make this project run.

## How to start

Firstly you have to make sure everything runs as intended, so be sure to have `virtualbox`, `vagrant`, `ansible` and `sshpass` installed on the machine, if you don't have them installed, you can use the following link and shell command:

`Virtualbox`: https://www.virtualbox.org/wiki/Downloads

```
$ sudo apt install -y vagrant
$ sudo apt install -y ansible
$ sudo apt install -y sshpass
```

Once everything is installed, you can move through the shell to the directory containing all the files, and just by using the shell command:
```
$ vagrant up
```
Once you run the command, vagrant will start creating and provisioning the machine with all the info inside the playbook, and in its turn creating the container through the docker file.
Once everything is set up, we will have 2 VM called `node1` and `node2` and in both of them there will be a container called `migration_node_container`. Now we just need to get inside the VM and check if everything is running as intended with the following commands:

```
$ vagrant ssh node1    #or node 2 depending which one you want to check; This allow us to connect in ssh with the VM
node1$ sudo docker ps -a    #This will show all running containers their status, and infos included since when is running
```
The containers should be running alternating every 60 seconds on the machines









